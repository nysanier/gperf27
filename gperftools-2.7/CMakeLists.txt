
# option
option(BUILD_SHARED_LIBS "build shared library(.so/.a)" OFF)

# version required
cmake_minimum_required(VERSION 3.8)
project(tcmalloc_ut)

if(BUILD_SHARED_LIBS)
    set(shared_str "shared")
else()
    set(shared_str "static")
endif()

message("build info: ${PROJECT_NAME}|${CMAKE_SYSTEM_NAME}|${CMAKE_BUILD_TYPE}|${shared_str}")

# path definitions
# set(PROJ_DIR ${PROJECT_SOURCE_DIR})
# set(SRC_DIR ${PROJ_DIR}/src)

include_directories(
    src
)

# compile definitions
add_definitions(
    -DNO_TCMALLOC_SAMPLES
    -DNO_FRAME_POINTER
    -DNO_HEAP_CHECK
    # -DTCMALLOC_FOR_DEBUGALLOCATION
    # -DDEBUGALLOCATION
    # -DENABLE_EMERGENCY_MALLOC
)

if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    add_definitions(-DNDEBUG)  # set for debug mode when need -DNDEBUG but not -O3
endif()

# if(NOT MSVC)
# add_compile_options(
    
# )
# endif()


# SpinLock etc.
aux_source_directory(src/base SRCS)
aux_source_directory(src SRCS)
# lib
add_library(tcmalloc
    ${SRCS}
)

add_executable(tcmalloc_unittest
    src/tests/tcmalloc_unittest.cc
    src/tests/testutil.cc
)

target_link_libraries(tcmalloc_unittest tcmalloc pthread)

# so version
# set_target_properties(secp256k1 PROPERTIES
#     VERSION "0.1"
#     SOVERSION "0"
# )

# install(TARGETS secp256k1
#     DESTINATION lib
# )
# install(FILES ${PROJ_DIR}/include/secp256k1_recovery.h
#     DESTINATION include
# )
# install(FILES ${PROJ_DIR}/include/secp256k1.h
#     DESTINATION include
# )
