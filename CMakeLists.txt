cmake_minimum_required(VERSION 3.17)

project (myLearnOpenGL)

if(APPLE) 
         set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${GCC_COVERAGE_LINK_FLAGS} -I/usr/local/lib -framework Cocoa -framework IOKit -framework CoreVideo -framework OpenGL -lglfw")
endif()
# 
# if(WIN32)
# ...
# elseif(APPLE)
# ...
# elseif(UNIX and not apple)
# ...
# endif()



# 一些设置, 比如设置根目录
configure_file(configuration/root_directory.h.in configuration/root_directory.h)
include_directories(${CMAKE_BINARY_DIR}/configuration)


# 添加头文件地址, 相等于g++ -I
# 添加安装系统目录中glfw库
include_directories(${PROJECT_SOURCE_DIR}/glfw-3.3.4/build/include) #添加头文件目径
# 添加库文件目录, 相等于g++ -L
link_directories(${PROJECT_SOURCE_DIR}/glfw-3.3.4/build/lib) #添加链接库路径

# glad
include_directories(${PROJECT_SOURCE_DIR}/glad/include) #添加头文件目径
link_directories(${PROJECT_SOURCE_DIR}/glad/) #添加链接库路径



# add_library(soil STATIC IMPORTED)
# set_target_properties(soil PROPERTIES IMPORTED_LOCATION ${CMAKE_SOURCE_DIR}/lib/libSOIL.a)



include_directories(${CMAKE_SOURCE_DIR}/include) #添加头文件


# 生成可执行文件 ${PROJECT_NAME}
add_executable(${PROJECT_NAME} main.cc)


# 为可执行文件${PROJECT_NAME}添加共享库链接
target_link_libraries(${PROJECT_NAME} 
        glad
        glfw3
)