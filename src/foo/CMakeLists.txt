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