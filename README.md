# C++ Project Template

![C++](docs/badges/C++.svg)
[![CMake](docs/badges/Made-with-CMake.svg)](https://cmake.org)
[![Docker](docs/badges/Made-with-Docker.svg)](https://www.docker.com)
![Linux](docs/badges/Linux.svg)

## Introduction

A *C++* project template built with *Docker*, *CMake*, *GoogleTest* and *GitHub Actions*.

## Building without Docker

### Prerequisites

- Install [*GoogleTest*](https://google.github.io/googletest).
- Install [*CMake*](https://cmake.org).

### Building

Set the location to the project folder and run:

```bash
mkdir build
cd build
cmake ..
cmake --build .
```

### Running Tests

Set the location to the `build` folder and run:

```bash
ctest -VV
```

### Running the Main Program

Set the location to the `build/bin` folder and run:

```bash
./cpp-sample
```

## Building with Docker

### Prerequisites

- Install [*Docker*](https://www.docker.com).

### Building

Set the location to the project folder and run:

```bash
docker image build . -t <name>
```

`<name>` should be replaced with a custom *Docker* image name.

### Running Tests

```bash
docker container run <name> ctest --test-dir .. -VV
```

### Running the Main Program

```bash
docker container run <name>
```

## Structure

```
.
├── .github
│   └── workflows
│       └── cmake.yaml
├── docs
│   └── badges
│       ├── C++.svg
│       ├── Linux.svg
│       ├── Made-with-CMake.svg
│       └── Made-with-Docker.svg
├── include
│   └── foo
│       └── foo.h
├── src
│   ├── foo
│   │   ├── CMakeLists.txt
│   │   ├── foo_private_test.cpp
│   │   └── foo.cpp
│   ├── CMakeLists.txt
│   └── main.cpp
├── tests
│   ├── CMakeLists.txt
│   └── foo_test.cpp
├── .clang-format
├── .gitignore
├── CMakeLists.txt
├── Dockerfile
└── README.md
```