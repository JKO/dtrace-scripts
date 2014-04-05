#!/usr/sbin/dtrace -s
syscall::open*:entry
/execname == "httpd"/
{
  @[copyinstr(arg0)] = count();
}