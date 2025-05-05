#ifndef OUR_GL_H
#define OUR_GL_H

#define GLM_ENABLE_EXPERIMENTAL
#include "tgaimage.h"
#include "our_gl.h"
#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtx/string_cast.hpp>
using namespace glm;

void viewport(int x, int y, int w, int h);

void projection(double coeff = 0); 

void lookat(const vec3 eye, const vec3 center, const vec3 up);

struct IShader {
    static TGAColor sample2D(const TGAImage &img, const vec2 &uvf) {
        return img.get(
            static_cast<int>(uvf[0] * img.width()), 
            static_cast<int>(uvf[1] * img.height())
        );
    }
    
    virtual bool fragment(vec3 bar, TGAColor &color) const = 0;
    
    virtual ~IShader() = default;
};

void rasterize(
    const vec4 clip_verts[3],
    const IShader &shader,
    TGAImage &image,
    std::vector<float> &zbuffer
);

#endif
