# 最低cmake版本要求
cmake_minimum_required(VERSION 3.14)

# 项目名称
project(multiple_dirs_demo1)

add_library(${PROJECT_NAME} SHARED sub1.h sub1.cpp)

