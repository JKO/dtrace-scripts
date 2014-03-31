#!/usr/sbin/dtrace -s
syscall::getdents64:entry
/execname == "ls"/
{
 self->p = arg1;
}
syscall::getdents64:return
/self->p/
{
  tracemem(copyin(self->p, arg1), 100); 
}

