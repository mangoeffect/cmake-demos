# 设置目标系统、处理器架构
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR arm)

# 设置工具链目录
set(TOOL_CHAIN_DIR ${CMAKE_CURRENT_LIST_DIR}/../)
set(TOOL_CHAIN_INCLUDE ${TOOL_CHAIN_DIR}/arm-linux-gnueabihf/include ${TOOL_CHAIN_DIR}/arm-linux-gnueabihf/libc/usr/include)
set(TOOL_CHAIN_LIB  ${TOOL_CHAIN_DIR}/arm-linux-gnueabihf/lib ${TOOL_CHAIN_DIR}/arm-linux-gnueabihf/libc/usr/lib)

# 设置编译器位置
set(CMAKE_C_COMPILER "${TOOL_CHAIN_DIR}/bin/arm-linux-gnueabihf-gcc.exe")
set(CMAKE_CXX_COMPILER "${TOOL_CHAIN_DIR}/bin/arm-linux-gnueabihf-g++.exe")

# 设置cmake查找主路径
set(CMAKE_FIND_ROOT_PATH ${TOOL_CHAIN_DIR}/arm-linux-gnueabihf)

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# 只在指定目录下查找库文件
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
# 只在指定目录下查找头文件
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
# 只在指定目录下查找依赖包
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

# 包含工具链文件
include_directories(
    ${TOOL_CHAIN_DIR}/arm-linux-gnueabihf/include
    ${TOOL_CHAIN_DIR}/arm-linux-gnueabihf/libc/usr/include)

# 设置CMAKE_INCLUDE_PATH
set(CMAKE_INCLUDE_PATH ${TOOL_CHAIN_INCLUDE})

# 设置CMAKE_LIBRARY_PATH
set(CMAKE_LIBRARY_PATH ${TOOL_CHAIN_LIB})