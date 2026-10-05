find_package(Protobuf CONFIG QUIET)
if (NOT Protobuf_FOUND)
    # Debian/Ubuntu libprotobuf-dev ships no CMake config file
    find_package(Protobuf REQUIRED)
endif ()

set(PROTO_FILES
        go/grpc_server/gen/libcore.proto
        )

add_library(myproto STATIC ${PROTO_FILES})
target_link_libraries(myproto
        PUBLIC
        protobuf::libprotobuf
        )
target_include_directories(myproto PUBLIC ${CMAKE_CURRENT_BINARY_DIR})

protobuf_generate(TARGET myproto LANGUAGE cpp)
