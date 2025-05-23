# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.25

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

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

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/jawier/Documents/my-renderer

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jawier/Documents/my-renderer/build

# Include any dependencies generated for this target.
include CMakeFiles/SoftRasterizer.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/SoftRasterizer.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/SoftRasterizer.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/SoftRasterizer.dir/flags.make

CMakeFiles/SoftRasterizer.dir/include/model.cpp.o: CMakeFiles/SoftRasterizer.dir/flags.make
CMakeFiles/SoftRasterizer.dir/include/model.cpp.o: /home/jawier/Documents/my-renderer/include/model.cpp
CMakeFiles/SoftRasterizer.dir/include/model.cpp.o: CMakeFiles/SoftRasterizer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jawier/Documents/my-renderer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/SoftRasterizer.dir/include/model.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/SoftRasterizer.dir/include/model.cpp.o -MF CMakeFiles/SoftRasterizer.dir/include/model.cpp.o.d -o CMakeFiles/SoftRasterizer.dir/include/model.cpp.o -c /home/jawier/Documents/my-renderer/include/model.cpp

CMakeFiles/SoftRasterizer.dir/include/model.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SoftRasterizer.dir/include/model.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jawier/Documents/my-renderer/include/model.cpp > CMakeFiles/SoftRasterizer.dir/include/model.cpp.i

CMakeFiles/SoftRasterizer.dir/include/model.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SoftRasterizer.dir/include/model.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jawier/Documents/my-renderer/include/model.cpp -o CMakeFiles/SoftRasterizer.dir/include/model.cpp.s

CMakeFiles/SoftRasterizer.dir/include/our_gl.cpp.o: CMakeFiles/SoftRasterizer.dir/flags.make
CMakeFiles/SoftRasterizer.dir/include/our_gl.cpp.o: /home/jawier/Documents/my-renderer/include/our_gl.cpp
CMakeFiles/SoftRasterizer.dir/include/our_gl.cpp.o: CMakeFiles/SoftRasterizer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jawier/Documents/my-renderer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/SoftRasterizer.dir/include/our_gl.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/SoftRasterizer.dir/include/our_gl.cpp.o -MF CMakeFiles/SoftRasterizer.dir/include/our_gl.cpp.o.d -o CMakeFiles/SoftRasterizer.dir/include/our_gl.cpp.o -c /home/jawier/Documents/my-renderer/include/our_gl.cpp

CMakeFiles/SoftRasterizer.dir/include/our_gl.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SoftRasterizer.dir/include/our_gl.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jawier/Documents/my-renderer/include/our_gl.cpp > CMakeFiles/SoftRasterizer.dir/include/our_gl.cpp.i

CMakeFiles/SoftRasterizer.dir/include/our_gl.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SoftRasterizer.dir/include/our_gl.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jawier/Documents/my-renderer/include/our_gl.cpp -o CMakeFiles/SoftRasterizer.dir/include/our_gl.cpp.s

CMakeFiles/SoftRasterizer.dir/include/tgaimage.cpp.o: CMakeFiles/SoftRasterizer.dir/flags.make
CMakeFiles/SoftRasterizer.dir/include/tgaimage.cpp.o: /home/jawier/Documents/my-renderer/include/tgaimage.cpp
CMakeFiles/SoftRasterizer.dir/include/tgaimage.cpp.o: CMakeFiles/SoftRasterizer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jawier/Documents/my-renderer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/SoftRasterizer.dir/include/tgaimage.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/SoftRasterizer.dir/include/tgaimage.cpp.o -MF CMakeFiles/SoftRasterizer.dir/include/tgaimage.cpp.o.d -o CMakeFiles/SoftRasterizer.dir/include/tgaimage.cpp.o -c /home/jawier/Documents/my-renderer/include/tgaimage.cpp

CMakeFiles/SoftRasterizer.dir/include/tgaimage.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SoftRasterizer.dir/include/tgaimage.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jawier/Documents/my-renderer/include/tgaimage.cpp > CMakeFiles/SoftRasterizer.dir/include/tgaimage.cpp.i

CMakeFiles/SoftRasterizer.dir/include/tgaimage.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SoftRasterizer.dir/include/tgaimage.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jawier/Documents/my-renderer/include/tgaimage.cpp -o CMakeFiles/SoftRasterizer.dir/include/tgaimage.cpp.s

CMakeFiles/SoftRasterizer.dir/src/main.cpp.o: CMakeFiles/SoftRasterizer.dir/flags.make
CMakeFiles/SoftRasterizer.dir/src/main.cpp.o: /home/jawier/Documents/my-renderer/src/main.cpp
CMakeFiles/SoftRasterizer.dir/src/main.cpp.o: CMakeFiles/SoftRasterizer.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/jawier/Documents/my-renderer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/SoftRasterizer.dir/src/main.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/SoftRasterizer.dir/src/main.cpp.o -MF CMakeFiles/SoftRasterizer.dir/src/main.cpp.o.d -o CMakeFiles/SoftRasterizer.dir/src/main.cpp.o -c /home/jawier/Documents/my-renderer/src/main.cpp

CMakeFiles/SoftRasterizer.dir/src/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/SoftRasterizer.dir/src/main.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/jawier/Documents/my-renderer/src/main.cpp > CMakeFiles/SoftRasterizer.dir/src/main.cpp.i

CMakeFiles/SoftRasterizer.dir/src/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/SoftRasterizer.dir/src/main.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/jawier/Documents/my-renderer/src/main.cpp -o CMakeFiles/SoftRasterizer.dir/src/main.cpp.s

# Object files for target SoftRasterizer
SoftRasterizer_OBJECTS = \
"CMakeFiles/SoftRasterizer.dir/include/model.cpp.o" \
"CMakeFiles/SoftRasterizer.dir/include/our_gl.cpp.o" \
"CMakeFiles/SoftRasterizer.dir/include/tgaimage.cpp.o" \
"CMakeFiles/SoftRasterizer.dir/src/main.cpp.o"

# External object files for target SoftRasterizer
SoftRasterizer_EXTERNAL_OBJECTS =

SoftRasterizer: CMakeFiles/SoftRasterizer.dir/include/model.cpp.o
SoftRasterizer: CMakeFiles/SoftRasterizer.dir/include/our_gl.cpp.o
SoftRasterizer: CMakeFiles/SoftRasterizer.dir/include/tgaimage.cpp.o
SoftRasterizer: CMakeFiles/SoftRasterizer.dir/src/main.cpp.o
SoftRasterizer: CMakeFiles/SoftRasterizer.dir/build.make
SoftRasterizer: /usr/lib/x86_64-linux-gnu/libGL.so
SoftRasterizer: /usr/lib/x86_64-linux-gnu/libX11.so
SoftRasterizer: CMakeFiles/SoftRasterizer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/jawier/Documents/my-renderer/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX executable SoftRasterizer"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/SoftRasterizer.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/SoftRasterizer.dir/build: SoftRasterizer
.PHONY : CMakeFiles/SoftRasterizer.dir/build

CMakeFiles/SoftRasterizer.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/SoftRasterizer.dir/cmake_clean.cmake
.PHONY : CMakeFiles/SoftRasterizer.dir/clean

CMakeFiles/SoftRasterizer.dir/depend:
	cd /home/jawier/Documents/my-renderer/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jawier/Documents/my-renderer /home/jawier/Documents/my-renderer /home/jawier/Documents/my-renderer/build /home/jawier/Documents/my-renderer/build /home/jawier/Documents/my-renderer/build/CMakeFiles/SoftRasterizer.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/SoftRasterizer.dir/depend

