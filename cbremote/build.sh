#!/bin/bash -e
#
# Builds 'cbremote' tool on Unix-type systems.
#
# Prerequisites: GCC 7+ or Clang; CMake 3.9+; ICU libraries (see README.md)
# Built libraries will appear in build_cmake subdirectory
#
# Mac developers may prefer to use the Xcode project.

SCRIPT_DIR=`dirname $0`
cd "$SCRIPT_DIR"

mkdir -p build_cmake
cd build_cmake

core_count=`getconf _NPROCESSORS_ONLN`
cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo ..
make -j `expr $core_count + 1`
