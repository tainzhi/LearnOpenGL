## edit CMakeLists.txt

```bash
cmake CMakeLists.txt
```

## download glad and compile so
```bash
gcc -Iinclude/ -shared src/glad.c -o glad.so
```

## problems
- build error: [`Undefined symbols for architecture x86_64`](https://github.com/cdcseacave/openMVS/issues/202)
>- add `set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${GCC_COVERAGE_LINK_FLAGS} -I/usr/local/lib -framework Cocoa -framework IOKit -framework CoreVideo -framework OpenGL -lglfw")` to CMakeLists.txt

## references
https://learnopengl-cn.readthedocs.io/zh/latest/04%20Advanced%20OpenGL/05%20Framebuffers/ | 帧缓冲 - LearnOpenGL-CN
https://www.cnblogs.com/iwiniwin/p/13705456.html | 使用VSCode和CMake构建跨平台的C/C++开发环境 - iwiniwin - 博客园
https://www.jianshu.com/p/891d630e30af | 搭建Mac OpenGL开发环境 - 简书
http://www.wld5.com/vscode/12543.html | OpenGL学习笔记（2）-，opengl学习笔记_vscode_悦橙教程
https://www.cnblogs.com/zjutzz/p/6815342.html | cmake简明使用指南 - ChrisZZ - 博客园
https://blog.51cto.com/9291927/2115399 | GNU开发工具——CMake快速入门-生命不息，奋斗不止-51CTO博客
https://blog.csdn.net/pix_csdn/article/details/90452959 | Linux上VScode + cmake + gcc开发环境搭建_pix_csdn的博客-CSDN博客
https://www.jianshu.com/p/6369cbd14528 | VSCode 安装使用和配置CMake工程 - 简书