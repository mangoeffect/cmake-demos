# 自动生成FindXXX.cmake脚本
import sys, getopt
import os


def write_help_info(file, lib_name):
    file.writelines("#--------------------demo--------------------\n")
    file.writelines("# \n")
    file.writelines("# set(CMAKE_MODULE_PATH = ${CMAKE_CURRENT_SOURCE_DIR}/cmake) \n")
    file.writelines("# project(import_" + lib_name + "_demo) \n")
    file.writelines("# find_package(" + lib_name + " REQUIRED) \n")
    file.writelines("# include_directories(${" + lib_name + "_INCLUDE_DIRS}) \n")
    file.writelines("# add_executable(${PROJECT_NAME} main.cpp) \n")
    file.writelines("# target_link_libraries(${PROJECT_NAME} ${" + lib_name + "_LIBRARIES}) \n")
    file.writelines("# \n")
    file.writelines("# ---------------------------------------------\n")

def search_lib_files(file_dir):
    libs = []
    for root, dirs, files in os.walk(file_dir):
        for file in files:
            if os.path.splitext(file)[1] == '.lib':
                libs.append(os.path.splitext(file)[0])
    return libs

def generate_cmake_file(argv):
    lib_name = "Vizum"
    mini_cmake_version = "3.12"
    include_dir_name = "include"
    debug_lib_dir = "lib/debug"
    release_lib_dir = "lib/release"
    file = open("Find" + lib_name + ".cmake","a")

    write_help_info(file, lib_name)
    file.writelines("# \n")
    file.writelines("cmake_minimum_required(VERSION " + mini_cmake_version + ") \n")
    file.writelines("# \n")
    file.writelines("if(NOT " + lib_name + "_FOUND) \n")
    file.writelines("   set(" + lib_name +"_INCLUDE_DIRS \"${CMAKE_CURRENT_LIST_DIR}/../" + include_dir_name + "\")\n")
    file.writelines("   set(" + lib_name +"_LIBRARIE_DIR_DEBUG \"${CMAKE_CURRENT_LIST_DIR}/../" + debug_lib_dir + "\" ) #debug \n")
    file.writelines("   set(" + lib_name +"_LIBRARIE_DIR_RELEASE \"${CMAKE_CURRENT_LIST_DIR}/../" + release_lib_dir + "\" ) #release \n")
    file.writelines("   set(" + lib_name +"_LIBRARIES_DIR ${" + lib_name + "_LIBRARIE_DIR_DEBUG} ${" + lib_name + "_LIBRARIE_DIR_RELEASE}) \n")

    current_dir = os.getcwd()
    debug_libs = search_lib_files(current_dir + "/" + debug_lib_dir)
    release_libs = search_lib_files(current_dir + "/" + release_lib_dir)
    file.writelines("# \n")
    file.writelines("   #find and set the debug libraries. \n")
    for d_lib in debug_libs:
        file.writelines("   find_library(" + d_lib + "_LIBRARY_DEBUG NAMES " + d_lib + "  PATHS ${" + lib_name + "_LIBRARIE_DIR_DEBUG} PATH_SUFFIXES lib) \n")
    file.writelines("# \n")
    file.writelines("   #find and set the release libraries. \n")
    for r_lib in release_libs:
        file.writelines("   find_library(" + r_lib + "_LIBRARY_DEBUG NAMES " + r_lib + "  PATHS ${" + lib_name + "_LIBRARIE_DIR_RELEASE} PATH_SUFFIXES lib) \n")

    file.writelines("# \n")
    file.writelines("   # merge debug and release libs to " + lib_name + "_LIBRARIES \n")
    file.writelines("   include(SelectLibraryConfigurations) \n")
    str_libs = ""
    for lib in debug_libs:
        file.writelines("   select_library_configurations( " + lib + " ) \n")
        str_libs = str_libs + " ${" + lib + "_LIBRARY} "
    file.writelines("   set(" + lib_name + "_LIBRARIES " + str_libs + ") \n")
    file.writelines("# \n")
    file.writelines("   include(FindPackageHandleStandardArgs) \n")
    file.writelines("   find_package_handle_standard_args(" + lib_name +" DEFAULT_MSG " + lib_name +"_INCLUDE_DIRS "+ lib_name +"_LIBRARIES_DIR "+ lib_name +"_LIBRARIES) \n")
    file.writelines("   mark_as_advanced("+ lib_name +"_INCLUDE_DIRS "+ lib_name + "_LIBRARIES_DIR  "+ lib_name +"_LIBRARIES) \n")
    file.writelines("endif() \n")
    file.close()


if __name__ == '__main__':
    generate_cmake_file(sys.argv[1:])


