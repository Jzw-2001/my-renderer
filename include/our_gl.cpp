#define GLM_ENABLE_EXPERIMENTAL
#include "our_gl.h"
#include <iostream>
#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtx/string_cast.hpp>

// 使用GLM类型别名替代原mat/vec
using namespace glm;
mat4 ModelView;
mat4 Viewport;
mat4 Projection;

// 重心坐标计算（改用GLM向量运算）
vec3 barycentric(const vec2 tri[3], const vec2 P)
{
    // 正确构造矩阵（转置原始行数据）
    mat3 ABC = mat3(
        vec3(tri[0].x, tri[0].y, 1.),
        vec3(tri[1].x, tri[1].y, 1.),
        vec3(tri[2].x, tri[2].y, 1.));

    float det = determinant(ABC);
    if (abs(det) < 1)
    {
        return vec3(-1, -1, -1);
    }

    return inverse(ABC) * vec3(P.x, P.y, 1.);
}

// 光栅化（适配GLM类型）
void rasterize(const vec4 clip_verts[3], const IShader &shader, TGAImage &image, std::vector<float> &zbuffer)
{
    vec4 pts[3] = {
        Viewport * clip_verts[0],
        Viewport * clip_verts[1],
        Viewport * clip_verts[2]};

    vec2 pts2[3] = {
        vec2(pts[0]) / pts[0].w,
        vec2(pts[1]) / pts[1].w,
        vec2(pts[2]) / pts[2].w};

    // 计算包围盒（使用GLM的min/max函数）
    ivec2 bbmin = ivec2(
        std::max(0, (int)floor(min(min(pts2[0].x, pts2[1].x), pts2[2].x))),
        std::max(0, (int)floor(min(min(pts2[0].y, pts2[1].y), pts2[2].y))));

    ivec2 bbmax = ivec2(
        std::min(image.width() - 1, (int)ceil(max(max(pts2[0].x, pts2[1].x), pts2[2].x)) - 1),
        std::min(image.height() - 1, (int)ceil(max(max(pts2[0].y, pts2[1].y), pts2[2].y)) - 1));

#pragma omp parallel for
    for (int x = bbmin.x; x <= bbmax.x; x++)
    {
        for (int y = bbmin.y; y <= bbmax.y; y++)
        {
            vec3 bc_screen = barycentric(pts2, vec2(static_cast<float>(x), static_cast<float>(y)));
            if (bc_screen.x < 0 || bc_screen.y < 0 || bc_screen.z < 0)
                continue;
            // 透视校正插值
            vec3 bc_clip = vec3(
                bc_screen.x / pts[0].w,
                bc_screen.y / pts[1].w,
                bc_screen.z / pts[2].w);
            bc_clip /= (bc_clip.x + bc_clip.y + bc_clip.z);

            float frag_depth = dot(bc_clip, vec3(clip_verts[0].z, clip_verts[1].z, clip_verts[2].z));
            if (frag_depth > zbuffer[x + y * image.width()])
                continue;

            TGAColor color;

            if (shader.fragment(bc_clip, color))
                continue;

            zbuffer[x + y * image.width()] = frag_depth;
            image.set(x, y, color);
        }
    }
}
