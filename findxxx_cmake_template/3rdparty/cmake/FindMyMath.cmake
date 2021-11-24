
cmake_minimum_required(VERSION 3.12)

if(NOT MyMath_FOUND)
    # 设置头文件包含目录变量
    set(MyMath_INCLUDE_DIRS "${CMAKE_CURRENT_LIST_DIR}/../include")
    
    # 设置库目录文件
    set(MyMath_LIBRARIE_DIR_DEBUG "${CMAKE_CURRENT_LIST_DIR}/../lib/debug") #debug
    set(MyMath_LIBRARIE_DIR_RELEASE "${CMAKE_CURRENT_LIST_DIR}/../lib/release") #release
    set(MyMath_LIBRARIES_DIR ${MyMath_LIBRARIE_DIR_DEBUG} ${MyMath_LIBRARIE_DIR_RELEASE})

    # 查找相应库文件
    #debug库文件
    find_library(ADD_LIBRARY_DEBUG NAMES addd  PATHS ${MyMath_LIBRARIE_DIR_DEBUG} PATH_SUFFIXES lib)
    find_library(MULTI_LIBRARY_DEBUG NAMES multid PATHS ${MyMath_LIBRARIE_DIR_DEBUG} PATH_SUFFIXES lib)
    #release库文件
    find_library(ADD_LIBRARY_RELEASE NAMES add PATHS ${MyMath_LIBRARIE_DIR_RELEASE} PATH_SUFFIXES lib)
    find_library(MULTI_LIBRARY_RELEASE NAMES multi PATHS ${MyMath_LIBRARIE_DIR_RELEASE} PATH_SUFFIXES lib)

    #自动选择debug或release版本库文件，并融合至一个变量MyMath_LIBRARIES
    include(SelectLibraryConfigurations)
    select_library_configurations( ADD )
    select_library_configurations( MULTI )
    set(MyMath_LIBRARIES ${ADD_LIBRARY} ${MULTI_LIBRARY})
    
    #将以下变量签名，以供调用findpackage查找后使用这些变量
    include(FindPackageHandleStandardArgs)
    find_package_handle_standard_args(MyMath DEFAULT_MSG MyMath_INCLUDE_DIRS MyMath_LIBRARIES_DIR MyMath_LIBRARIES)

    #将以下变量变量标记为高级变量，在使用cmake-gui程序的时候可以显示
    mark_as_advanced(MyMath_INCLUDE_DIRS MyMath_LIBRARIES_DIR  MyMath_LIBRARIES)
endif()
