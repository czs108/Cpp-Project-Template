add_executable(${CMAKE_PROJECT_NAME})

target_sources(${CMAKE_PROJECT_NAME}
    PRIVATE
        main.cpp
)

add_subdirectory(foo)

target_link_libraries(${CMAKE_PROJECT_NAME}
    PRIVATE
        foo
)