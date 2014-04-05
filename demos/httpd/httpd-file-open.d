#!/usr/sbin/dtrace -s
syscall::open*:entry
/execname == "httpd"/
{
  trace(copyinstr(arg1))
}