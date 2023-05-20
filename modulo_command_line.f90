! This program computes the modulo using command line arguments as inputs
program modulo_command_line
    implicit none
    ! These are the variables used for arithmetic
    integer :: dividend, divisor, result
    ! Args array
    character(len=12), dimension(:), allocatable :: args
    ! Format string
    character(len=*), parameter :: fmt_in = '(I10)'
    character(len=*), parameter :: fmt_out = '(I0)'
    ! Argument counter and status variable
    integer :: argc, iostat1, iostat2
    
    argc = command_argument_count()

    if (argc == 2 ) then
        ! Allocate space for arguments
        allocate(args(2))
        ! Read in arguments from command line
        call get_command_argument(1,args(1))
        call get_command_argument(2,args(2))
        ! Try to convert to integers
        read (args(1),fmt_in, iostat=iostat1) dividend
        read (args(2),fmt_in, iostat=iostat2) divisor
        ! Check that the input actually can be represented as integers
        if (iostat1/=0 .or. iostat2/=0) then 
            deallocate(args)
            call print_usage()
            stop
        endif
        ! Compute the result
        result = modulo(dividend, divisor)
        ! Print the result to standard out
        write(*,fmt_out) result
        ! Free arguments
        deallocate(args)
    else
        call print_usage()
    endif

contains

    ! Tell the user how to use the program
    subroutine print_usage()
        print *, 'usage:'
        print *, 'modulo_cli.exe <integer::dividend> <integer::divisor>'
    end subroutine print_usage

end program modulo_command_line