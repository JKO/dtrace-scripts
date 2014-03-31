#!/usr/sbin/dtrace -s

syscall::write:entry
/execname =="cat"/
{
	self->p = arg1;
}
syscall::write:return
/self->p/
{

	tracemem(copyin(self->p,1000),1000);
}
