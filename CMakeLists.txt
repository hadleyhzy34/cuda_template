cmake_minimum_required(VERSION 3.8)
project(project_name LANGUAGES CXX CUDA)
enable_language(CUDA)

if(NOT DEFINED CMAKE_CUDA_STANDARD)
  set(CMAKE_CUDA_STANDARD 11)
  set(CMAKE_CUDA_STANDARD_REQUIRED ON)
endif()

add_library(libs src/cudaMatMul.cu src/cudaMatMul.h)
target_compile_features(libs PUBLIC cxx_std_11)

add_executable(${PROJECT_NAME} src/main.cpp)
target_link_libraries(${PROJECT_NAME} libs)
