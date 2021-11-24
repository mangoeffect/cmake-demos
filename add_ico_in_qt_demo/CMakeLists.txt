# cmake最低版本号要求
cmake_minimum_required(VERSION 3.14)

# 项目名称
project(add_ico_in_qt_demo)

# qt相关设置，设置moc、rcc、uic
set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

# 包含当前目录
include_directories(./)
# 搜索Qt5
find_package(Qt5 COMPONENTS Widgets REQUIRED)

# 设置ico
if(WIN32)
    set(app_WINRC app_win32.rc)
    set_property(SOURCE app_win32.rc APPEND PROPERTY OBJECT_DEPENDS app_logo.ico)
endif()


# 编译生成可执行文件
add_executable(${PROJECT_NAME}
main.cpp 
mainwindow.cpp
mainwindow.ui
${app_WINRC}
)

# 链接qt库文件
target_link_libraries(${PROJECT_NAME}  Qt5::Widgets)