## Learn notes
https://learnopengl-cn.github.io/01%20Getting%20started/01%20OpenGL/
- 立即渲染模式和核心模式
- context上下文

https://learnopengl-cn.github.io/01%20Getting%20started/03%20Hello%20Window/

- 双缓冲(Double buffer): 一个缓冲保存输出到屏幕的数据，另一个缓冲保存保存渲染指令操作后的数据。渲染结束后，交换前后buffer，图像就显示出来。解决单buffer的闪烁问题。

https://learnopengl-cn.github.io/01%20Getting%20started/04%20Hello%20Triangle/
- 顶点数组对象
- 顶点缓冲对象
- 索引缓冲对象

图形渲染管线(Graphics Pipeline): 3D -> 2D, 2D坐标转变为像素
着色器
光栅化阶段
Alpha测试和混合Blending
Normalized Device Coordinates: 左(-1, 0), 上(0, 1)
GL_STATIC_DRAW
GL_DYNAMIC_DRAW
GL_STREAM_DRAW
EBO

https://learnopengl-cn.github.io/01%20Getting%20started/05%20Shaders/

颜色rgba, 纹理坐标stpq
layout(location = 0)
in/out
Uniform: 全局, 从cpu想gpu中的着色器发送程序, 除非重置或更新不然一直保存

https://learnopengl-cn.github.io/01%20Getting%20started/06%20Textures/

Texture纹理
纹理坐标: 起始于(0,0)左下角, 终于右上角(1,1)
采样Sampling: 使用纹理坐标获取纹理颜色
纹理环绕方式: GL_REPEAT等
纹理过滤: GL_NEAREST更颗粒, GL_LINEAR更平滑
多级渐变(Mipmap)

https://learnopengl-cn.github.io/01%20Getting%20started/08%20Coordinate%20Systems/
局部空间, 世界空间, 观察空间, 裁剪空间, 屏幕空间
Model矩阵, View矩阵, 投影矩阵
透视除法(Perspective Division): x,y,z/w, 4D剪裁空间坐标转3D坐标
正射投影举证(Orthographic Projection Matrix)
透视投影矩阵(Perspective Project Matrix)


## vscode c++
能自动补全: 在`.vscode/c_cpp_properties.json`中添加头文件目录, 比如`${workspaceFolder/include}`
## windows配置gcc/make/g++环境
下载[mingw-64 win build](http://win-builds.org/doku.php/download) (最好配置下代理，加快下载速度), 解压后安装在**没有空格路径的目录中**, 尤其不能是**c:\program files**. 比如可以是 `D:\ProgramInstalled`. 然后把`bin`目录添加到环境变量中

配置make: 上一步的`bin`目录中的`mingw32-make.exe`, 复制一份, 重命名为`make.exe`
把

下载 [cmake](https://cmake.org/download/), 解压后添加到环境变量


一键执行
```shell
cmake -G "Unix Makefiles" -S . -B build && make -C build -j8 && ./build/myLearnOpenGL
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
