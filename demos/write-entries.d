#!/usr/sbin/dtrace -s

syscall::write:entry
/execname =="cat"/

{
	tracemem(copyin(arg1,80),80)
}
