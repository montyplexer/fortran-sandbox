! Brute force approach to determining primality
program is_prime_brute
    implicit none
    
    ! Args array
    character(len=32), dimension(:), allocatable :: args
    ! Argument counter and I/O status variables
    integer :: argc, iostat
    ! Format string
    character(len=*), parameter :: fmt_in = '(I32)'

    ! Integer that is being tested for primality
    integer(16) :: p
    ! Loop index / modulus to test
    integer(16) :: n


    argc = command_argument_count()

    if (argc == 1) then

        ! Allocate space for arguments
        allocate(args(1))
        
        ! Read in arguments from command line
        call get_command_argument(1,args(1))
        
        ! Try to convert to integers
        read (args(1), fmt_in, iostat=iostat) p
        
        ! Check that the input actually can be represented as integers
        if (iostat/=0) then 
            deallocate(args)
            call print_usage()
            stop
        endif
        
        ! We are defining primes to be positive, starting at 2
        if (p < 2) then
            deallocate(args)
            print *,'Please choose a number greater than 1.'
            stop
        endif

        ! Check base case of p=2
        ! That way we can eliminate checking even numbers
        if (modulo(p,2) == 0) then
            deallocate(args)
            if (p == 2) then 
                print *,'Prime'
            else
                print *,'Composite'
            endif
            stop
        endif

        ! Brute force method: check divisibility of all integers less than half of the number
        ! Worst case is when p is prime and large: O(p)
        do n = 3, (p/2), 2
            if (modulo(p,n) == 0) then
                deallocate(args)
                print *,'Composite'
                stop
            endif
        enddo 

        ! If we made it here, p is prime
        deallocate(args)
        print *,'Prime'

    else
        call print_usage()
    endif

contains

    ! Tell the user how to use the program
    subroutine print_usage()
        print *, 'usage:'
        print *, 'is_prime_brute.exe <integer::p>'
    end subroutine print_usage

end program is_prime_brute