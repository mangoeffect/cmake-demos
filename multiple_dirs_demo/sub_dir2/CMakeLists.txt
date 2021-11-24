# 最低cmake版本要求
cmake_minimum_required(VERSION 3.14)

# 项目名称
project(multiple_dirs_demo2)

add_executable(${PROJECT_NAME} sub2.h sub2.cpp)
target_link_libraries(${PROJECT_NAME} multiple_dirs_demo1)
