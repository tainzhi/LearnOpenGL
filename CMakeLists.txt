cmake_minimum_required(VERSION 3.17)
project (myLearnOpenGL)
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${GCC_COVERAGE_LINK_FLAGS} -I/usr/local/lib -framework Cocoa -framework IOKit -framework CoreVideo -framework OpenGL -lglfw")

include_directories(/usr/local/Cellar/glfw/3.3.2/include) #添加头文件目径
link_directories(/usr/local/Cellar/glfw/3.3.2/lib) #添加链接库路径
include_directories(./glad/include) #添加头文件
link_directories(./glad/glad) #添加链接库路径

add_executable(${PROJECT_NAME} main.cc ./glad/src/glad.c)
