# Modern C++ Continuous Integration

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](/LICENSE)
[![codecov](https://codecov.io/gh/GillianGrayson/ModernCppCI/branch/master/graph/badge.svg)](https://codecov.io/gh/GillianGrayson/ModernCppCI)

| Build status          | Systems / Compilers         |
| ------------- | ------------------------------------------ |
| [![CLang  / GCC / XCode Builds](https://travis-ci.org/GillianGrayson/ModernCppCI.svg?branch=master)](https://travis-ci.org/GillianGrayson/ModernCppCI) | Linux (clang  / gcc) OSX (XCode clang) |
| [![Visual Studio Builds](https://ci.appveyor.com/api/projects/status/ih7bv9b0u475phjk?svg=true)](https://ci.appveyor.com/project/GillianGrayson/moderncppci)       | Windows (Visual Studio 2017 / 2015)  |

## info
This is an example of doing a Modern C++ project with CI.

It use basic [C++14](https://isocpp.org/wiki/faq/cpp14-language) syntax, but nothing really complicated.

This project try to follow [C++ Core Guidelines](https://github.com/isocpp/CppCoreGuidelines) whenever its possible.

[CMake](https://cmake.org/) is the chosen build system using [ctest](https://cmake.org/Wiki/CMake/Testing_With_CTest).

## libraries used
- [spdlog](https://github.com/gabime/spdlog) for a moderm log system. (as submodule)
- [Catch2](https://github.com/catchorg/Catch2.git) as the test framework.  (as submodule)

## creating repository
Simply copy/paste the folder (without the .git folder) and run the .bat file (renaming to .sh should work for linux).
This will create an initial git commit and add the required submodules.

##  project structure

| folder       | Content              |
| ------------ | -------------------- |
| [/lib](/lib) | library |
| [/lib/src](/lib/src) | library sources  |
| [/lib/include](/lib/include) | library includes |
| [/lib/test](/lib/test) | library test |
| [/app](/app) | application |
| [/app/src](/app/src) | application sources  |
| [/app/test](/app/test) | application test |
| [/third_party](/third_party) | third party software        |

## Generate project

```shell
  cmake -H. -BBuild
```

Auto detect everything.

If you like to set a implicit compiler set the variable CXX=${COMPILER}, for example COMPILER could be gcc, clang and so on.

Auto detect in Windows usually generate a Visual Studio project since msbuild require it, but in OSX does not generate and XCode project, since is not required for compiling using XCode clang.

Specify build type debug/release

```shell
  # generate a debug project
  cmake -H. -BBuild -DCMAKE_BUILD_TYPE=Debug
  # generate a release project
  cmake -H. -BBuild -DCMAKE_BUILD_TYPE=Release
```

Specify architecture

```shell
  # 64 bits architecture
  cmake -H. -BBuild -Ax64
  # ARM architecture
  cmake -H. -BBuild -AARM
  # Windows 32 bits architecture
  cmake -H. -BBuild -AxWin32
```

Generate different project types

```shell
  # MinGW makefiles
  cmake -H. -BBuild -G "MinGW Makefiles"
  # XCode project
  cmake -H. -BBuild -G "XCode"
  # Visual Studio 15 2017 solution
  cmake -H. -BBuild -G "Visual Studio 15 2017"
```

## Build

From the Build folder

```shell
  # build the default build type (in multi build types usually debug)
  cmake --build .
  # build a specific build type
  cmake --build . --config Release
```
## Run tests

From the Build folder

```shell
  # run all test using the default build type
  ctest -V
  # run all test in Release build type
  ctest -V -C Release
```

## references

- https://cmake.org/
- https://docs.travis-ci.com/user/languages/cpp/
- https://www.appveyor.com/docs/lang/cpp/
- https://github.com/isocpp/CppCoreGuidelines
- https://github.com/catchorg/Catch2
- https://github.com/gabime/spdlog
- https://www.appveyor.com/docs/lang/cpp/
- https://docs.travis-ci.com/user/languages/cpp/
