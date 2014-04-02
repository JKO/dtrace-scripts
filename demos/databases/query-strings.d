#!/usr/sbin/dtrace -s

mysql*:::query-start
{
  @[copyinstr(arg0)] = count();
}