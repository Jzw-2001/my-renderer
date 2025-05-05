#define GLM_ENABLE_EXPERIMENTAL
#include "tgaimage.h"
#include "model.h"
#include <glm/glm.hpp>
#include <glm/gtc/matrix_transform.hpp>
#include <glm/gtx/string_cast.hpp>
#include <iostream>
#include <sstream>

using namespace glm;
using namespace std;

Model::Model(const std::string &filename)
{
    std::ifstream in(filename, std::ios::in);
    if (!in.is_open())
    {
        std::cerr << "Failed to open " << filename << std::endl;
        return;
    }

    std::string line;
    while (std::getline(in, line))
    {
        std::istringstream iss(line);
        char trash;

        if (line.compare(0, 2, "v ") == 0)
        {
            iss >> trash;
            vec3 v;
            iss >> v.x >> v.y >> v.z;
            verts.push_back(v);
        }
        else if (line.compare(0, 3, "vn ") == 0)
        {
            iss >> trash >> trash;
            vec3 n;
            iss >> n.x >> n.y >> n.z;
            norms.push_back(normalize(n));
        }
        else if (line.compare(0, 3, "vt ") == 0)
        {
            iss >> trash >> trash;
            vec2 uv;
            iss >> uv.x >> uv.y;
            tex.emplace_back(uv.x, 1.0 - uv.y);
        }
        else if (line.compare(0, 2, "f ") == 0)
        {
            iss >> trash;
            int f, t, n;
            char sep;
            int cnt = 0;
            while (iss >> f >> sep >> t >> sep >> n)
            {
                facet_vrt.push_back(f - 1);
                facet_tex.push_back(t - 1);
                facet_nrm.push_back(n - 1);
                cnt++;
            }
            if (cnt != 3)
            {
                std::cerr << "Error: Only triangulated faces supported" << std::endl;
                in.close();
                return;
            }
        }
    }
    in.close();

    auto load_texture = [&filename](const std::string &suffix, TGAImage &img)
    {
        size_t dot = filename.find_last_of(".");
        if (dot == std::string::npos)
            return false;
        std::string texfile = filename.substr(0, dot) + suffix;
        bool ret = img.read_tga_file(texfile.c_str());
        std::cerr << "Texture " << texfile << " loading "
                  << (ret ? "success" : "failed") << std::endl;
        return ret;
    };

    load_texture("_diffuse.tga", diffusemap);
    load_texture("_nm_tangent.tga", normalmap);
    load_texture("_spec.tga", specularmap);

    std::cerr << "Model stats: " << nverts() << " verts, "
              << nfaces() << " faces, " << tex.size() << " texcoords, "
              << norms.size() << " normals\n";
}

int Model::nverts() const { return static_cast<int>(verts.size()); }
int Model::nfaces() const { return static_cast<int>(facet_vrt.size() / 3); }

vec3 Model::vert(int i) const { return verts[i]; }

vec3 Model::vert(int iface, int nthvert) const
{
    return verts[facet_vrt[iface * 3 + nthvert]];
}

vec3 Model::normal(int iface, int nthvert) const
{
    return norms[facet_nrm[iface * 3 + nthvert]];
}

vec3 Model::normal(const vec2 &uv) const
{
    TGAColor c = normalmap.get(static_cast<int>(uv.x * normalmap.width()),
                               static_cast<int>(uv.y * normalmap.height()));
    return (vec3(c[2], c[1], c[0]) * (2.0f / 255.0f)) - vec3(1.0);
}

vec2 Model::uv(int iface, int nthvert) const
{
    return tex[facet_tex[iface * 3 + nthvert]];
}

const TGAImage &Model::diffuse() const { return diffusemap; }
const TGAImage &Model::specular() const { return specularmap; }
