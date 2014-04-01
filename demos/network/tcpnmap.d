#!/usr/sbin/dtrace -s

dtrace:::BEGIN
{
	printf("tracing for possible nmap scans ... Hit ctrl-C to end .\n")
}
tcp:::accept-refused
{
	@num["TCP_connect()_scan", args[2]->ip_daddr] = count();
}
tcp:::receive
/args[4]->tcp_flags == 0/
{
	@num["TCP_null_scan", args[2]->ip_saddr] = count();
}
tcp:::receive
/args[4]->tcp_flags == (TH_URG|TH_PUSH|TH_FIN)/
{
	@num["TCP_Xmas_scan", args[2]->ip_saddr] = count();
}

dtrace:::END
{
	printf("Possible scan events: \n\n");
	printf("%-20s %-24s %8s\n","TYPE", "HOST", "COUNT");
	printa("%-20s %-24s %@8d\n", @num);
}
