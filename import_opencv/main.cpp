// cmake构建opencv示例
// @mango

#include "opencv2/opencv.hpp"

#include <iostream>

int main()
{
    std::cout<<"CMake构建opencv示例:"<<std::endl;
    std::cout<< cv::getBuildInformation() <<std::endl;
    return 0;
}