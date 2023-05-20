! Print the remainder of the first input integer mod the second input integer
! Note: this program does not do error-checking
program modulo_user_input
    ! "implicit none" prevents any implicit typing from happening
    ! which is a VERY GOOD THING in Fortran
    implicit none
    
    ! Our input integers and output integer
    integer :: dividend, divisor, result

    print *, 'Enter the number you want to be modulo''d:'
    read(*,*) dividend

    print *, 'Enter the number you want to modulo by:'
    read(*,*) divisor

    result = modulo(dividend, divisor)

    print *, 'Result: ', result

end program modulo_user_input