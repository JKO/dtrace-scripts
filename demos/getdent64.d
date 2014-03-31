#!/usr/sbin/dtrace -s
syscall::getdents*:entry
/execname == "ls"/
{
 self->p = arg1;
}
syscall::getdents*:return
/self->p/
{
  tracemem(copyin(self->p, arg0), 100); 
}

