
cmake_minimum_required(VERSION 3.14)

# 设置工具链cmake文件， 需自己下载符合自己硬件的linaro交叉编译工具包
set(CMAKE_TOOLCHAIN_FILE ${CMAKE_SOURCE_DIR}/gcc-linaro-7.5.0-2019.12-i686-mingw32_arm-linux-gnueabihf/cmake/toolchain.cmake)

# 设置mingw编译器路径
project(cross_compile_demo)
set(CMAKE_MAKE_PROGRAM = "C:/Program Files/mingw-w64/x86_64-8.1.0-posix-seh-rt_v6-rev0/mingw64/bin/mingw32-make.exe")

add_executable(${PROJECT_NAME} main.cpp)

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/add)

