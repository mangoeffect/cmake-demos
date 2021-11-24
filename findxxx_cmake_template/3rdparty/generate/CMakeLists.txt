cmake_minimum_required(VERSION 3.14)

project(generate_lib)

include_directories(./include)
add_library(add  STATIC  ./src/add.cpp)
add_library(multi STATIC ./src/multi.cpp)

# 设置编译库文件版本后缀
set(CMAKE_DEBUG_POSTFIX "d" CACHE STRING "add a postfix, usually d on windows")
set(CMAKE_RELEASE_POSTFIX "" CACHE STRING "add a postfix, usually empty on windows")
set(CMAKE_RELWITHDEBINFO_POSTFIX "rd" CACHE STRING "add a postfix, usually empty on windows")
set(CMAKE_MINSIZEREL_POSTFIX "s" CACHE STRING "add a postfix, usually empty on windows")
 
if (CMAKE_BUILD_TYPE MATCHES "Release")
    set(CMAKE_BUILD_POSTFIX "${CMAKE_RELEASE_POSTFIX}")
elseif(CMAKE_BUILD_TYPE MATCHES "MinSizeRel")
    set(CMAKE_BUILD_POSTFIX "${CMAKE_MINSIZEREL_POSTFIX}")
elseif(CMAKE_BUILD_TYPE MATCHES "RelWithDebInfo")
    set(CMAKE_BUILD_POSTFIX "${CMAKE_RELWITHDEBINFO_POSTFIX}")
elseif(CMAKE_BUILD_TYPE MATCHES "Debug")
    set(CMAKE_BUILD_POSTFIX "${CMAKE_DEBUG_POSTFIX}")
else()
    set(CMAKE_BUILD_POSTFIX "")
endif()

#设定安装目录
set(CMAKE_INSTALL_PREFIX "${PROJECT_SOURCE_DIR}")

# 安装 include 文件
install(DIRECTORY ./inlucde DESTINATION include
FILES_MATCHING PATTERN "*.h")

# 将库文件，可执行文件安装到指定目录
install(TARGETS add multi
CONFIGURATIONS Release
LIBRARY DESTINATION "lib/release"
ARCHIVE DESTINATION "lib/release"
RUNTIME DESTINATION "bin/release" 
)

install(TARGETS add multi
CONFIGURATIONS Debug
LIBRARY DESTINATION "lib/debug"
ARCHIVE DESTINATION "lib/debug"
RUNTIME DESTINATION "bin/debug" 
)




