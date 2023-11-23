cmake_minimum_required(VERSION 3.8 FATAL_ERROR)
project(
  cuda_template
  VERSION 0.1.0
  LANGUAGES C CXX CUDA)
enable_language(CUDA)
# check_language(CUDA)
include(CheckLanguage)
check_language(CUDA)

if(NOT DEFINED CMAKE_CUDA_STANDARD)
  set(CMAKE_CUDA_STANDARD 11)
  set(CMAKE_CUDA_STANDARD_REQUIRED ON)
endif()

# note that for .cpp files, if you need to include <cuda_runtime.h>, you must
# manually add following
include_directories("${CMAKE_CUDA_TOOLKIT_INCLUDE_DIRECTORIES}")

include(CTest)
enable_testing()

add_library(cuda_lib src/hello.cuh src/hello.cu)
target_compile_features(cuda_lib PUBLIC cxx_std_14)
set_target_properties(cuda_lib PROPERTIES CUDA_SEPARABLE_COMPILATION ON)

add_executable(${PROJECT_NAME} src/main.cpp)
target_link_libraries(${PROJECT_NAME} cuda_lib)
# set_target_properties(cuda_lib PROPERTIES CUDA_SEPARABLE_COMPILATION ON)

set(CPACK_PROJECT_NAME ${PROJECT_NAME})
set(CPACK_PROJECT_VERSION ${PROJECT_VERSION})
include(CPack)
