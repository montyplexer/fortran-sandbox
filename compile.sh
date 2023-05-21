#!/bin/bash

# Remove old executables
rm -rf ./executables

# Build executables anew
mkdir ./executables
cmake .
make all

# Remove CMake artifacts
rm -rf ./build
rm -rf ./CMakeFiles
rm CMakeCache.txt
rm cmake_install.cmake

echo "Finished generating runnables!"
