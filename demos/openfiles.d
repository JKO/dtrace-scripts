#!/usr/sbin/drtace -s
syscall::openat:entry
{
	printf("%s opened %s\n", execname, copyinstr(arg1))
}
