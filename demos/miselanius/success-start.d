#!/usr/sbin/dtrace -s
proc:::exec-success
{
	trace(execname)
}
