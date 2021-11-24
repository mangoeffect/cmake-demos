# 最低cmake版本要求
cmake_minimum_required(VERSION 3.14)

# 项目名称
project(import_opencv_demo)

# 查找OpenCV
find_package(OpenCV REQUIRED)

# 包含OpenCV头文件目录
include_directories(${OpenCV_INCLUDE_DIRS})

# 编译生成可执行文件
add_executable(${PROJECT_NAME} main.cpp)

# 链接OpenCV库文件
target_link_libraries(${PROJECT_NAME} ${OpenCV_LIBS})