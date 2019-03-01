# Distributed under the MIT License (See accompanying file /LICENSE )

# CMake build : global project

cmake_minimum_required (VERSION 3.3)

project (ModernCppCI)

set_property (GLOBAL PROPERTY USE_FOLDERS ON)

set (CMAKE_CXX_STANDARD 14)
set (CMAKE_CXX_STANDARD_REQUIRED ON)

set (THREADS_PREFER_PTHREAD_FLAG ON)
find_package (Threads REQUIRED)

add_subdirectory (third_party EXCLUDE_FROM_ALL)
add_subdirectory (lib)
add_subdirectory (app)

enable_testing ()

option (CODE_COVERAGE "Enable coverage reporting" OFF)
if (CODE_COVERAGE AND CMAKE_CXX_COMPILER_ID MATCHES "GNU|Clang")
  # Add required flags (GCC & LLVM/Clang)
  target_compile_options(${LIB_NAME} INTERFACE
    -O0        # no optimization
    -g         # generate debug info
    --coverage # sets all required flags
  )
  target_link_libraries(${LIB_NAME} INTERFACE --coverage)
endif()
