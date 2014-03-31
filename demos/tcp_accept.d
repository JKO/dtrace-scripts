#!/usr/sbin/dtrace -s

tcp:::accept-established
{
	printf("\n Connections ==>> %s %d", args[3]->tcps_raddr, args[3]->tcps_lport)
}
