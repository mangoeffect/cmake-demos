#include "add.h"
#include "multi.h"

#include <iostream>

int main(int argc, char* argv[])
{
    std::cout<<" 1 + 2 = "<<add(1, 2)<<std::endl;
    std::cout<<" 1 * 2 = "<<multi(1, 2)<<std::endl;
    return 0;
}



