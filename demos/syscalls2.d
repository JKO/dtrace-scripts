#!/usr/sbin/dtrace -qs

syscall:::entry
/pid == $1/
{
	@[probefunc] = count();
}
syscall::rexit:entry
{
	exit(0)
}
