# 最低cmake版本要求
cmake_minimum_required(VERSION 3.14)

# 项目名称
project(qt_quick_demo)

# qt相关设置，设置moc、rcc、uic
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

# 包含当前目录
include_directories(./)

# 搜索qt core quick模块
find_package(Qt5 COMPONENTS Core Quick REQUIRED)

# 编译生成可执行文件
add_executable(${PROJECT_NAME} "main.cpp" "qml.qrc")

# 链接qt相关模块
target_link_libraries(${PROJECT_NAME}  Qt5::Core Qt5::Quick)
