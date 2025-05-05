#!/bin/bash

# 一键CMake配置+编译+运行脚本
# 保存为 build_and_run.sh 后执行: chmod +x build_and_run.sh && ./build_and_run.sh

set -e  # 遇到错误立即退出

# 配置参数
BUILD_DIR="build"
TARGET_NAME="SoftRasterizer"
EXECUTABLE="./${BUILD_DIR}/${TARGET_NAME} obj/diablo3_pose/diablo3_pose.obj obj/floor.obj"

# 清理旧构建（可选）
echo ">> 清理旧构建..."
rm -rf ${BUILD_DIR} 

# 创建构建目录
echo ">> 创建构建目录..."
mkdir -p ${BUILD_DIR}
cd ${BUILD_DIR}

# 运行CMake
echo ">> 运行CMake..."
cmake .. -DCMAKE_BUILD_TYPE=Release  # 或 Debug

# 编译项目
echo ">> 开始编译..."
cmake --build . --config Release --parallel 4  # 使用4线程加速

# 返回上级目录并运行程序
cd ..
echo ">> 运行程序..."
${EXECUTABLE}
