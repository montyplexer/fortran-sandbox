cmake_minimum_required(VERSION 3.0)
project(fortran-sandbox)
enable_language(Fortran)

set(
    EXECUTABLES
    hello_world
    modulo_user_input
    modulo_command_line
    calc_factorial
)


foreach(EXECUTABLE IN LISTS EXECUTABLES)
    add_executable(${EXECUTABLE}.exe ${EXECUTABLE}.f90) 
    set_target_properties(${EXECUTABLE}.exe PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/executables")
endforeach()
