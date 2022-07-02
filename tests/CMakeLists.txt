add_executable(public-test)

target_link_libraries(public-test
    PRIVATE
        ${GTEST_LIBS}
        ${GMOCK_LIBS}
)

target_sources(public-test
    PRIVATE
        foo_test.cpp
)

target_link_libraries(public-test
    PRIVATE
        foo
)

gtest_discover_tests(public-test)