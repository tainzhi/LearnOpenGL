cmake_minimum_required(VERSION 3.17)

# enable C++17
set(CMAKE_CXX_STANDARD 17)

project (myLearnOpenGL)

if(APPLE) 
         set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${GCC_COVERAGE_LINK_FLAGS} -I/usr/local/lib -framework Cocoa -framework IOKit -framework CoreVideo -framework OpenGL -lglfw")
endif()


# 从根目录下Textures加载图片
set(RESOURCE_ROOT "${CMAKE_SOURCE_DIR}/resources/")
message("source_root=${RESOURCE_ROOT}")
# 每个课程对应地当前目录
set(SRC_ROOT "${CMAKE_SOURCE_DIR}/0-Gettings-Started/Transformations")
message("src_root=${SRC_ROOT}")
file(GLOB MAIN_SRC "${SRC_ROOT}/1-2-container-rotate-scale.cc")
message("main_src=${MAIN_SRC}")

# 在根目录下configuration定义，然后 build/configuration/root_directory.h 
configure_file(${CMAKE_SOURCE_DIR}/configuration/root_directory.h.in ${CMAKE_BINARY_DIR}/configuration/root_directory.h)
include_directories(${CMAKE_BINARY_DIR}/configuration)

# glfw3
add_library(glfw3 STATIC IMPORTED)
set_target_properties(glfw3 PROPERTIES
        IMPORTED_LOCATION "${CMAKE_SOURCE_DIR}/glfw-3.3.4/build/lib/libglfw3.a"
        INTERFACE_INCLUDE_DIRECTORIES "${CMAKE_SOURCE_DIR}/glfw-3.3.4/build/include"
)

# glad
add_library(glad STATIC IMPORTED)
set_target_properties(glad PROPERTIES
        IMPORTED_LOCATION "${PROJECT_SOURCE_DIR}/glad/libglad.a" 
        INTERFACE_INCLUDE_DIRECTORIES "${PROJECT_SOURCE_DIR}/glad/include"
)

# add_library(soil STATIC IMPORTED)
# set_target_properties(soil PROPERTIES IMPORTED_LOCATION ${CMAKE_SOURCE_DIR}/lib/libSOIL.a)

include_directories(${CMAKE_SOURCE_DIR}/include) #添加头文件

# 生成可执行文件 ${PROJECT_NAME}
add_executable(${PROJECT_NAME} ${MAIN_SRC})

# 为可执行文件${PROJECT_NAME}添加共享库链接
target_link_libraries(${PROJECT_NAME} 
        glad
        glfw3
)