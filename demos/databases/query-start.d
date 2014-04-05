#!/usr/sbin/dtrace -s
mysql*:::query-start
{
  trace(copyinstr(arg0))
}