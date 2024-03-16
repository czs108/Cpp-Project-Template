# C++ Project Template

![C++](docs/badges/C++.svg)
![PowerShell](docs/badges/PowerShell.svg)
[![CMake](docs/badges/Made-with-CMake.svg)](https://cmake.org)
[![Make](docs/badges/Made-with-Make.svg)](https://www.gnu.org/software/make/manual/make.html)
[![Docker](docs/badges/Made-with-Docker.svg)](https://www.docker.com)
[![GitHub Actions](docs/badges/Made-with-GitHub-Actions.svg)](https://github.com/features/actions)
![Linux](docs/badges/Linux.svg)

## Introduction

A C++ project template on [*Ubuntu*](https://ubuntu.com) built with:

- [*Docker*](https://www.docker.com)
- [*CMake*](https://cmake.org)
- [*Make*](https://www.gnu.org/software/make/manual/make.html)
- [*GitHub Actions*](https://github.com/features/actions)
- [*GoogleTest*](https://google.github.io/googletest)

## Building with *CMake*

### Prerequisites

- Install *GoogleTest*.
- Install *CMake*.

### Building

Go to the project folder and run:

```bash
mkdir -p build
cd build
cmake ..
cmake --build .
```

### Running Tests

Go to the `build` folder and run:

```bash
ctest -VV
```

### Running the Main Program

Go to the `build/bin` folder and run:

```bash
./cpp-sample
```

## Building with *Docker*

### Prerequisites

- Install *Docker*.

### Building

Go to the project folder and run the following command to create an image:

```bash
docker image build . -t <image>
```

`<image>` should be replaced with a custom *Docker* image name.

### Running Tests

```bash
docker container run <image> ctest --test-dir .. -VV
```

### Running the Main Program

```bash
docker container run <image>
```

## Building with *Make*

Currently `Makefile` does not support *GoogleTest*.

### Building

Go to the project folder and run:

```bash
make
```

### Running the Main Program

Go to the `build` folder and run:

```bash
./cpp-sample
```

## Structure

```
.
├── .github
│   └── workflows
│       └── build-test.yaml
├── cmake
│   └── hello.cmake
├── docs
│   └── badges
│       ├── C++.svg
│       ├── Linux.svg
│       ├── Made-with-CMake.svg
│       ├── Made-with-Make.svg
│       ├── Made-with-Docker.svg
│       ├── Made-with-GitHub-Actions.svg
│       └── PowerShell.svg
├── include
│   └── foo
│       └── foo.h
├── src
│   ├── foo
│   │   ├── CMakeLists.txt
│   │   ├── foo.cpp
│   │   ├── private_foo_test.cpp
│   │   ├── private_foo.cpp
│   │   └── private_foo.h
│   ├── CMakeLists.txt
│   └── main.cpp
├── tests
│   ├── CMakeLists.txt
│   └── foo_test.cpp
├── .clang-format
├── .gitignore
├── Build-CMake.ps1
├── CITATION.cff
├── CMakeLists.txt
├── Dockerfile
├── Makefile
└── README.md
```