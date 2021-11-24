# cmake最低版本号要求
cmake_minimum_required(VERSION 3.14)

# 项目名称
project(import_qt_demo)

# qt相关设置，设置moc、rcc、uic
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON) #打开全局rcc，本示例中没有使用qrc，此句可以去掉

# 包含当前目录
include_directories(./)
# 搜索Qt5
find_package(Qt5 COMPONENTS Widgets REQUIRED)

# 编译生成可执行文件
add_executable(${PROJECT_NAME}
main.cpp 
mainwindow.cpp
mainwindow.ui
)

# 链接qt库文件
target_link_libraries(${PROJECT_NAME}  Qt5::Widgets)