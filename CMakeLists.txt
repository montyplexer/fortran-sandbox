cmake_minimum_required(VERSION 3.0)
project(fortran-sandbox)
enable_language(Fortran)

set(
    EXECUTABLES
    hello_world
    modulo_user_input
    modulo_command_line
    calc_factorial
    is_prime_brute
    is_prime_trial_division
    # 2023 05 24
    prime_factor_trial_division_recursive
    prime_factor_trial_division
)


foreach(EXECUTABLE IN LISTS EXECUTABLES)
    add_executable(${EXECUTABLE}.exe ${EXECUTABLE}.f90) 
    set_target_properties(${EXECUTABLE}.exe PROPERTIES RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/executables")
endforeach()
