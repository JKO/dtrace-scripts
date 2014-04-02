#!/usr/sbin/dtrace -s

mysql*:::query-start
{
  @[copyinstr(arg3)] = count();
}