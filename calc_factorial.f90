! This program recursively calculates n!, where n comes from a command line argument.
! It can produce an accurate value up to 33!, after which the returned integer overflow takes effect.
program calc_factorial
    implicit none

    integer(16) :: n, fact_result

    ! Args array
    character(len=12), dimension(:), allocatable :: args

    ! Format string
    character(len=*), parameter :: fmt_in = '(I20)'
    character(len=*), parameter :: fmt_out = '(I0)'
    
    ! Argument counter and I/O status variables
    integer :: argc, iostat
    argc = command_argument_count()

    if (argc == 1) then

        ! Allocate space for arguments
        allocate(args(1))
        
        ! Read in arguments from command line
        call get_command_argument(1,args(1))
        
        ! Try to convert to integers
        read (args(1),fmt_in, iostat=iostat) n
        
        ! Check that the input actually can be represented as integers
        if (iostat/=0) then 
            deallocate(args)
            call print_usage()
            stop
        endif
        
        ! The value 33! is the largest number that a signed 16-Byte number can handle
        if (n > 33) then
            deallocate(args)
            print *,'Integer Overflow!'
            stop
        endif

        ! Compute the result
        fact_result = factorial(n)
        
        ! Print the result to standard out
        write(*,fmt_out) fact_result
        
        ! Free arguments
        deallocate(args)

    else
        call print_usage()
    endif

contains

    ! Calculate the factorial of n
    recursive function factorial(n) result (rval)
        integer(16), intent(in) :: n
        integer(16) :: rval

        if (n <= 1) then 
            rval = 1;
        else 
            rval = n * factorial(n-1)
        endif
    end function factorial  

    ! Tell the user how to use the program
    subroutine print_usage()
        print *, 'usage:'
        print *, 'calc_factorial.exe <integer::n>'
    end subroutine print_usage

end program
