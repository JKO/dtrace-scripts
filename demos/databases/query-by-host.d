#!/usr/sbin/dtrace -s
mysql*:::query-start
{
  @[copyinstr(arg4)] = count();
}