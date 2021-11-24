# 最低cmake版本要求
cmake_minimum_required(VERSION 3.14)

# 项目名称
project(multiple_files_demo)

# 包含当前目录
include_directories(./)

# 编译生成可执行文件
add_executable(${PROJECT_NAME} main.cpp add.cpp)

add_subdirectory()