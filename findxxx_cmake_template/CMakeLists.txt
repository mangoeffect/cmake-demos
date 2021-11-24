cmake_minimum_required(VERSION 3.14)

project(find_xxx_demo)

set(CMAKE_MODULE_PATH = ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty/cmake)
message(STATUS -------------${CMAKE_MODULE_PATH}--------------)
find_package(MyMath REQUIRED)
if(MyMath_FOUND)
    message(STATUS MyMath "include directories ="${MyMath_INCLUDE_DIRS})
else()
endif()

include_directories(${MyMath_INCLUDE_DIRS})
add_executable(${PROJECT_NAME} main.cpp)
target_link_libraries(${PROJECT_NAME} ${MyMath_LIBRARIES})

