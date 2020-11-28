## edit CMakeLists.txt

```bash
cmake CMakeLists.txt
```

## download glad and compile so
```bash
gcc -Iinclude/ -shared src/glad.c -o glad.so
```

## download and install [soil](https://github.com/littlstar/soil)
- 不使用soil, 使用[stb_image](https://learnopengl-cn.github.io/01%20Getting%20started/06%20Textures/)
- 图片路径只能绝对路径



## problems
- build error: [`Undefined symbols for architecture x86_64`](https://github.com/cdcseacave/openMVS/issues/202)
>- add `set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${GCC_COVERAGE_LINK_FLAGS} -I/usr/local/lib -framework Cocoa -framework IOKit -framework CoreVideo -framework OpenGL -lglfw")` to CMakeLists.txt

## references
https://learnopengl-cn.readthedocs.io/zh/latest/04%20Advanced%20OpenGL/05%20Framebuffers/ | 帧缓冲 - LearnOpenGL-CN
https://www.cnblogs.com/iwiniwin/p/13705456.html | 使用VSCode和CMake构建跨平台的C/C++开发环境 - iwiniwin - 博客园
https://www.jianshu.com/p/891d630e30af | 搭建Mac OpenGL开发环境 - 简书
http://www.wld5.com/vscode/12543.html | OpenGL学习笔记（2）-，opengl学习笔记_vscode_悦橙教程
https://www.cnblogs.com/zjutzz/p/6815342.html | cmake简明使用指南 - ChrisZZ - 博客园
https://www.jianshu.com/p/6369cbd14528 | VSCode 安装使用和配置CMake工程 - 简书