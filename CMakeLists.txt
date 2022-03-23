cmake_minimum_required(VERSION 3.22)

project(test-openslide)

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

find_package (PkgConfig REQUIRED)
pkg_check_modules (GLIB2 REQUIRED glib-2.0)

find_package(OpenSlide REQUIRED)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/out/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/out/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/out/bin)

include_directories (${GLIB2_INCLUDE_DIRS})
link_directories (${GLIB2_LIBRARY_DIRS})

file(GLOB sources src/*.h src/*.c)
add_executable(test-openslide ${sources})
target_link_libraries(test-openslide ${GLIB2_LIBRARIES} ${OPENSLIDE_LIBRARY})

set(CMAKE_BUILD_TYPE Debug)