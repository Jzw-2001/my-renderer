cmake_minimum_required(VERSION 3.10)  # Debian 11默认CMake版本
project(SoftRasterizer VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 调试符号配置（Debug模式自动添加-g）
set(CMAKE_BUILD_TYPE Debug CACHE STRING "Build type")

# 查找系统依赖（Debian需安装libgl1-mesa-dev）
find_package(OpenGL REQUIRED)
find_package(X11 REQUIRED)

# 添加可执行文件
# 定义自动扫描函数
function(auto_add_sources TARGET_NAME ROOT_DIR)
    file(GLOB_RECURSE SOURCES 
        "${ROOT_DIR}/*.cpp" 
        "${ROOT_DIR}/*.c"
    )
    target_sources(${TARGET_NAME} PRIVATE ${SOURCES})
endfunction()
# 使用示例
add_executable(${PROJECT_NAME} "")
auto_add_sources(${PROJECT_NAME} "include")
auto_add_sources(${PROJECT_NAME} "src")


# 包含目录
target_include_directories(${PROJECT_NAME} PRIVATE
  include/
  thirdparty/glm/
)

# 链接库
target_link_libraries(${PROJECT_NAME} PRIVATE
  OpenGL::GL
  X11::X11
  pthread  # 多线程支持
)

# 安装规则（可选）
install(TARGETS ${PROJECT_NAME} DESTINATION bin)