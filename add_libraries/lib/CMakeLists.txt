cmake_minimum_required(VERSION 3.14)

project(add)

add_library(${PROJECT_NAME} STATIC add.h add.cpp)
# add_library(${PROJECT_NAME} SHARED add.h add.cpp)
