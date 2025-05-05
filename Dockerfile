FROM debian

# 安装基础工具链
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    libgl1-mesa-dev \
    xorg-dev  # X11依赖

# 配置开发用户
RUN useradd -m dev && usermod -aG video dev
USER dev
WORKDIR /home/dev/app

COPY --chown=dev:dev . .

# 初始化子模块
RUN git submodule update --init --recursive

# 构建命令
CMD ["bash", "-c", "mkdir -p build && cd build && cmake .. && make"]
