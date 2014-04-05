#!/usr/sbin/dtrace -s
syscall::chdir:entry
/execname == "sshd"/
{
  printf("UID:%d %s", uid,copyinstr(arg0));
}