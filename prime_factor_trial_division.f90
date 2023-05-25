! Print the prime factorization of the input integer
program prime_factor_trial_division
    implicit none

    ! Args array
    character(len=32), dimension(:), allocatable :: args
    ! Argument counter and I/O status variables
    integer :: argc, iostat
    ! Format strings
    character(len=*), parameter :: fmt_in = '(I32)'
    character(len=*), parameter :: fmt_out = '(I0)'

    ! Integer that is being tested for primality
    integer(16) :: p

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
        
        ! Edge cases: -1, 0, 1
        ! Negatives have -1 ammended to front of factorization
        if (p == 0) then
            deallocate(args)
            print *,'0'
            stop
        elseif (p == 1) then
            deallocate(args)
            print *,'1'
            stop
        elseif (p == -1) then
            deallocate(args)
            print *,'-1'
            stop
        elseif (p < -1) then
            write (*,fmt_out,advance='no') -1
            write (*,'(A)',advance='no') ' '
            p = -p
        endif

        ! Check base case of p=2
        ! That way we can eliminate checking even numbers
        p = factor_two(p)

        ! Trial division test method: check divisibility of all integers less than square root of number
        ! Worst case is when p is prime and large: O(sqrt(p))
        p = factor(p)

        ! If we made it here, p is prime
        deallocate(args)
        print *,''
    else
        call print_usage()
    endif

contains

! Factors out a single factor of n recursively until n = 1
function factor(p) result (rval)
    integer(16) :: p, n
    integer(16) :: rval   

    n = 3
    do while (n*n <= p)
        if (modulo(p,n) == 0) then
            write (*,fmt_out,advance='no') n
            write (*,'(A)',advance='no') ' '
            p = p / n
        else
            n = n + 2
        endif
    enddo 
    write (*,fmt_out,advance='no') p
    rval = p

end function factor

function factor_two(p) result (rval)
    integer(16) :: p
    integer(16) :: rval    
    
    do while (modulo(p,2) == 0)
        write (*,fmt_out,advance='no') 2
        write (*,'(A)',advance='no') ' '
        p = p / 2
    enddo
    rval = p

end function factor_two

! Tell the user how to use the program
subroutine print_usage()
    print *, 'usage:'
    print *, 'prime_factor_trial_division.exe <integer::p>'
end subroutine print_usage

end program prime_factor_trial_division