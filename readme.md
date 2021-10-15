## vscode c++
能自动补全: 在`.vscode/c_cp_properties.json`中添加头文件目录, 比如`${workspaceFolder/include}`
## windows配置gcc/make/g++环境
下载[mingw-64 win build](http://win-builds.org/doku.php/download), 解压后安装在**没有空格路径的目录中**, 尤其是**c:\program files**. 然后把`bin`目录添加到环境变量中

配置make: 上一步的`bin`目录中的`mingw32-make.exe`, 复制一份, 重命名为`make.exe`
把

下载 [cmake](https://cmake.org/download/), 解压后添加到环境变量


一键执行
```shell
cmake -G "Unix Makefiles" && make -j8 && ./myLearnOpenGL
```

**在`.vscode/tasks.json`中已经配置好, 所以可以直接Terminal > Run build task, 快捷键`ctrl + shift + b`**

### debug
在`.vscode/tasks.json`中添加了cmake的参数`-DCMAKE_BUILD_TYPE=Debug`, 确定`label:make_run`.

那么在`.vscode/launch.json`中指定`gdb`位置和`"preLaunchTask": "make_run"`, 显然`make_run`就是`tasks.json`中的任务.

task的执行从Terminal > Run Build Task即可.

`launch.json`从左侧的Run And Debug生成后launch.json并配置好后, 就可以直接F5运行

## linux
```shell
# 第一次运行, 可能要清除 CMakeCache.txt
rm -rf CMakeCache.txt
cmake CMakeLists.txt && make -j8 && myLearnOpenGL
```

## 在运行之前, 配置好glad和glfw

### download [glad](https://glad.dav1d.de/) and compile so
已经下载好, 放置在根目录下`glad`. 需要编译生成静态库`libglad.a`
```bash
gcc -Iinclude/ -shared src/glad.c -o glad.so

# windows生成静态库libglad.a
# 在glad目录, 生成glad.o
gcc -Iinclude -c .\src\glad.c
# 生成静态库
ar -cr libglad.a .\glad.o

# windows, 动态库以 .dll结尾
# cmake17后, 无法识别dll动态库, 故不采用
gcc -Iinclude/ --shared .\src\glad.c -o libglad.dll
```

### [glfw](https://www.glfw.org/download.html)
也已经下载好源码, 放置在根目录下`glfw-3.3.4`. 当然也可以下载已经编译好的windows lib

当然也可以自行编译
```
cd glfw-3.3.4
# 安装在当前目录下的build
cmake -G "MinGW Makefiles" -S . -B . -DCMAKE_INSTALL_PREFIX=build

make -j8

# 在build目录下生成lib和include
make install
```
## download and install [soil](https://github.com/littlstar/soil)
- 不使用soil, 使用[stb_image](https://learnopengl-cn.github.io/01%20Getting%20started/06%20Textures/)
- 图片路径只能绝对路径

## [dowaload glm](https://github.com/g-truc/glm)
- a header-only library, and thus does not need to be compiled

```shell
g++ -std=c++11 -I./include -I./glad/include -I./configuration -L./glad -I"glfw-3.3.4/build/include" -L"glfw-3.3.4/build/lib" -lglad -lglfw3 main.cc-o main.exe
```

## Reference
- [LearnOpenGL光照](https://learnopengl-cn.github.io/02%20Lighting/02%20Basic%20Lighting/)
- [不基于LearnOpenGL配置OpenGL的开发环境](https://blog.csdn.net/FatalFlower/article/details/108686549)

## 遇到的问题
#### windows 10无法找到动态库 dll
When using MinGW tools, the find_library() command no longer finds .dll files by default. Instead, it expects .dll.a import libraries to be available.
[更多参考](https://github.com/msys2/MINGW-packages/issues/6394)


#### macOS build error: [`Undefined symbols for architecture x86_64`](https://github.com/cdcseacave/openMVS/issues/202)
add `set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} ${GCC_COVERAGE_LINK_FLAGS} -I/usr/local/lib -framework Cocoa -framework IOKit -framework CoreVideo -framework OpenGL -lglfw")` to CMakeLists.txt
