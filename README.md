# fortran-sandbox
A collection of small and random Modern Fortran programs made for the purpose of learning the language.

## Program List
- hello_world

A basic 'Hello World' program.

- modulo_user_input

Prompts the user for a modulus dividend and divisor and prints the remainder.

- modulo_command_line

Accepts dividend and divisor arguments when program is called, and prints the remainder.

- calc_factorial

Recursively calculates n!, where n is provided as a command line argument (cla).

- is_prime_brute

Tests if cla is prime using naive brute force algorithm, $`O(n)`$.

- is_prime_trial_division

Tests if cla is prime using trial division algorithm, $`O(\sqrt{n})`$.

## How to Compile
Go to the root directory and run ```./compile.sh```. This script builds the executables and removes any CMake artifacts.

Alternatively, navigate to the root folder and run ```cmake .```, followed by ```make all```.
Navigate to ```cd ./executables``` to find all runnable mini-programs.

## Dependencies
This project relies on CMake and the make tool. The GNU Fortran compiler was used to make the executables.

## To-Do List
- [ ] GCD Calculator
- [ ] LCM Calculator
- [ ] Extended Euclidean Algorithm
- [ ] Chinese Remainder Theorem
- [ ] Phi, Sigma, Tau multiplicative functions
- [ ] Is Prime? Variations
- [ ] Find Quadratic Residues
- [ ] Calculate Jacobi symbol
- [ ] Affine Cipher Encrypter and Decrypter
- [ ] Exponential Cipher Encrypter and Decrypter
- [ ] RSA w/ signing 
- [ ] Coin-flipping algorithm
- [ ] Primality tests