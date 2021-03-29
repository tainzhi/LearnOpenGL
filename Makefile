# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

# Default target executed when no arguments are given to make.
default_target: all

.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.17.1/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.17.1/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/muqing/code/myLearnOpenGL

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/muqing/code/myLearnOpenGL

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/usr/local/Cellar/cmake/3.17.1/bin/cmake --regenerate-during-build -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache

.PHONY : rebuild_cache/fast

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake cache editor..."
	/usr/local/Cellar/cmake/3.17.1/bin/ccmake -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache

.PHONY : edit_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /Users/muqing/code/myLearnOpenGL/CMakeFiles /Users/muqing/code/myLearnOpenGL/CMakeFiles/progress.marks
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /Users/muqing/code/myLearnOpenGL/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean

.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named myLearnOpenGL

# Build rule for target.
myLearnOpenGL: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 myLearnOpenGL
.PHONY : myLearnOpenGL

# fast build rule for target.
myLearnOpenGL/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/myLearnOpenGL.dir/build.make CMakeFiles/myLearnOpenGL.dir/build
.PHONY : myLearnOpenGL/fast

#=============================================================================
# Target rules for targets named glad

# Build rule for target.
glad: cmake_check_build_system
	$(MAKE) $(MAKESILENT) -f CMakeFiles/Makefile2 glad
.PHONY : glad

# fast build rule for target.
glad/fast:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/glad.dir/build.make CMakeFiles/glad.dir/build
.PHONY : glad/fast

glad/src/glad.o: glad/src/glad.c.o

.PHONY : glad/src/glad.o

# target to build an object file
glad/src/glad.c.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/glad.dir/build.make CMakeFiles/glad.dir/glad/src/glad.c.o
.PHONY : glad/src/glad.c.o

glad/src/glad.i: glad/src/glad.c.i

.PHONY : glad/src/glad.i

# target to preprocess a source file
glad/src/glad.c.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/glad.dir/build.make CMakeFiles/glad.dir/glad/src/glad.c.i
.PHONY : glad/src/glad.c.i

glad/src/glad.s: glad/src/glad.c.s

.PHONY : glad/src/glad.s

# target to generate assembly for a file
glad/src/glad.c.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/glad.dir/build.make CMakeFiles/glad.dir/glad/src/glad.c.s
.PHONY : glad/src/glad.c.s

main.o: main.cc.o

.PHONY : main.o

# target to build an object file
main.cc.o:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/myLearnOpenGL.dir/build.make CMakeFiles/myLearnOpenGL.dir/main.cc.o
.PHONY : main.cc.o

main.i: main.cc.i

.PHONY : main.i

# target to preprocess a source file
main.cc.i:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/myLearnOpenGL.dir/build.make CMakeFiles/myLearnOpenGL.dir/main.cc.i
.PHONY : main.cc.i

main.s: main.cc.s

.PHONY : main.s

# target to generate assembly for a file
main.cc.s:
	$(MAKE) $(MAKESILENT) -f CMakeFiles/myLearnOpenGL.dir/build.make CMakeFiles/myLearnOpenGL.dir/main.cc.s
.PHONY : main.cc.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... edit_cache"
	@echo "... rebuild_cache"
	@echo "... glad"
	@echo "... myLearnOpenGL"
	@echo "... glad/src/glad.o"
	@echo "... glad/src/glad.i"
	@echo "... glad/src/glad.s"
	@echo "... main.o"
	@echo "... main.i"
	@echo "... main.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system

