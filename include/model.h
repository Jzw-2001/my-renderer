#ifndef MODEL_H
#define MODEL_H

#include "tgaimage.h"
#include <glm/glm.hpp>
#include <vector>
#include <string>

using namespace glm;

class Model {
    std::vector<vec3> verts;
    std::vector<vec3> norms;
    std::vector<vec2> tex;
    std::vector<int> facet_vrt;
    std::vector<int> facet_nrm; 
    std::vector<int> facet_tex;
    
    TGAImage diffusemap;
    TGAImage normalmap;
    TGAImage specularmap;

public:
    Model(const std::string& filename);
    
    int nverts() const;
    int nfaces() const;
    
    vec3 vert(int i) const;
    vec3 vert(int iface, int nthvert) const;
    vec3 normal(int iface, int nthvert) const;
    vec3 normal(const vec2& uv) const;
    vec2 uv(int iface, int nthvert) const;
    
    const TGAImage& diffuse() const;
    const TGAImage& specular() const;
};

#endif
