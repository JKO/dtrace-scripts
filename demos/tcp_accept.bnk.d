#!/usr/sbin/dtrace -s

tcp:::accept-established
{
	trace(args[3]->tcps_raddr);trace (args[3]->tcps_lport);trace(execname);trace(timestamp)
}
