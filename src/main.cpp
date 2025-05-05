#include <limits>
#include <iostream>
#include <vector>
#include "model.h"
#include "our_gl.h"
#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>

using namespace glm;

// 全局状态矩阵
extern mat4 ModelView;
extern mat4 Viewport;
extern mat4 Projection;

struct Shader : IShader
{
    const Model &model;
    vec3 uniform_l;    // 光照方向（视图坐标系）
    mat3x2 varying_uv; // 三角形UV坐标（顶点着色器写入，片段着色器读取）
    mat3 varying_nrm;  // 逐顶点法线（用于插值）
    mat3 view_tri;     // 视图坐标系中的三角形

    Shader(const vec3 &l, const Model &m) : model(m)
    {
        // 使用GLM进行向量变换
        uniform_l = normalize(mat3(ModelView) * l);
    }

    virtual void vertex(const int iface, const int nthvert, vec4 &gl_Position)
    {
        vec3 n = model.normal(iface, nthvert);
        vec3 v = model.vert(iface, nthvert);
        gl_Position = ModelView * vec4(v, 1.0f);
        varying_uv[nthvert] = model.uv(iface, nthvert);
        varying_nrm[nthvert] = normalize(vec3(transpose(inverse(ModelView)) * vec4(n, 0.0f)));
        view_tri[nthvert] = vec3(gl_Position);
        gl_Position = Projection * gl_Position;
    }

    virtual bool fragment(const vec3 bar, TGAColor &gl_FragColor) const
    {
        // 法线插值
        vec3 bn = normalize(varying_nrm * bar);
        vec2 uv = varying_uv * bar;
        // 重建TBN矩阵
        vec3 dp1 = view_tri[1] - view_tri[0];
        vec3 dp2 = view_tri[2] - view_tri[0];
        vec2 duv1 = varying_uv[1] - varying_uv[0];
        vec2 duv2 = varying_uv[2] - varying_uv[0];
        mat2 inv_uv = inverse(mat2(duv1, duv2));
        vec3 tangent = normalize(inv_uv[0][0] * dp1 + inv_uv[0][1] * dp2);
        vec3 bitangent = normalize(inv_uv[1][0] * dp1 + inv_uv[1][1] * dp2);
        mat3 TBN = mat3(tangent, bitangent, bn);
        // 法线贴图应用
        vec3 tangent_normal = model.normal(uv);
        vec3 n = normalize(TBN * tangent_normal);
        vec3 r = reflect(normalize(uniform_l), n);
        float diff = std::max(0.0f, dot(n, uniform_l));
        float spec = pow(std::max(-r.z, 0.0f),
                         5.0f + sample2D(model.specular(), uv)[0]);

        // 最终颜色计算
        TGAColor c = sample2D(model.diffuse(), uv);
        for (int i = 0; i < 3; i++)
        {
            gl_FragColor[i] = std::min(10 + int(c[i] * (diff + spec)), 255);
        }
        return false;
    }
};

int main(int argc, char **argv)
{
    if (argc < 2)
    {
        std::cerr << "Usage: " << argv[0] << " obj/model.obj" << std::endl;
        return 1;
    }

    // 常量定义
    const int width = 800;
    const int height = 800;
    const vec3 light_dir(1.0f, 1.0f, 1.0f);
    const vec3 eye(0.0f, 0.0f, 3.0f);
    const vec3 center(0.0f, 0.0f, 0.0f);
    const vec3 up(0.0f, 1.0f, 0.0f);

    // 初始化矩阵
    ModelView = lookAt(eye, center, up);
    const int _x = width / 8;
    const int _y = height / 8;
    const int _screen_width = width * 3 / 4;
    const int _screen_height = height * 3 / 4;
    Viewport = mat4(
        vec4(_screen_width / 2., 0, 0, 0),
        vec4(0, _screen_height / 2., 0, 0),
        vec4(0, 0, 1, 0),
        vec4(_x + _screen_width / 2., _y + _screen_height / 2., 0, 1));
    Projection = perspective(radians(45.0f), (float)width / height, 0.1f, 50.0f);
    std::vector<float> zbuffer(width * height, std::numeric_limits<float>::max());
    TGAImage framebuffer(width, height, TGAImage::RGB);

    // 模型加载和渲染
    for (int m = 1; m < argc; m++)
    {
        Model model(argv[m]);
        Shader shader(light_dir, model);

        for (int t = 0; t < model.nfaces(); t++)
        {
            vec4 clip_vert[3];
            for (int v : {0, 1, 2})
            {
                shader.vertex(t, v, clip_vert[v]);
            }
            rasterize(clip_vert, shader, framebuffer, zbuffer);
        }
    }

    // 输出结果
    framebuffer.write_tga_file("framebuffer.tga");
    std::cout << "Rendering completed: framebuffer.tga" << std::endl;
    return 0;
}
