cmake_minimum_required(VERSION 3.17)
project (myLearnOpenGL)
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${GCC_COVERAGE_LINK_FLAGS} -I/usr/local/lib -framework Cocoa -framework IOKit -framework CoreVideo -framework OpenGL -lglfw")

# 一些设置, 比如设置根目录
configure_file(configuration/root_directory.h.in configuration/root_directory.h)
include_directories(${CMAKE_BINARY_DIR}/configuration)

# 添加安装系统目录中glfw库
include_directories(/usr/local/Cellar/glfw/3.3.2/include) #添加头文件目径
link_directories(/usr/local/Cellar/glfw/3.3.2/lib) #添加链接库路径

add_library(
    glad STATIC glad/src/glad.c
)
target_include_directories(glad
    PUBLIC
    ${PROJECT_SOURCE_DIR}/glad/include
)

add_library(soil STATIC IMPORTED)
set_target_properties(soil PROPERTIES IMPORTED_LOCATION ${CMAKE_SOURCE_DIR}/lib/libSOIL.a)

# 添加头文件地址, 相等于g++ -I
include_directories(${CMAKE_SOURCE_DIR}/include) #添加头文件

# 添加库文件目录, 相等于g++ -L
# link_directories(${CMAKE_SOURCE_DIR}/lib)

# 生成可执行文件 ${PROJECT_NAME}
add_executable(${PROJECT_NAME} main.cc)
# 为可执行文件${PROJECT_NAME}添加共享库链接
target_link_libraries(${PROJECT_NAME} glad soil)

