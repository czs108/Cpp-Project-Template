add_library(foo)

set(HEADER_PATH ${PROJECT_SOURCE_DIR}/include/foo)

target_include_directories(foo PRIVATE ${HEADER_PATH})
target_include_directories(foo PUBLIC ${PROJECT_SOURCE_DIR}/include)

target_sources(foo
    PUBLIC
        ${HEADER_PATH}/foo.h
    PRIVATE
        foo.cpp
)

# Build private tests
add_executable(foo-test)

target_link_libraries(foo-test
    PRIVATE
        ${GTEST_LIBS}
        ${GMOCK_LIBS}
        $<TARGET_PROPERTY:foo,LINK_LIBRARIES>
)

target_include_directories(foo-test
    PRIVATE
        $<TARGET_PROPERTY:foo,INCLUDE_DIRECTORIES>
)

target_sources(foo-test
    PRIVATE
        foo_private_test.cpp
)

gtest_discover_tests(foo-test)