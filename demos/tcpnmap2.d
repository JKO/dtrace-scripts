#!/usr/sbin/dtrace -s

dtrace:::BEGIN
{
	printf("tracing for possible nmap scans ... Hit ctrl-C to end .\n")
}
tcp:::receive
/args[4]->tcp_flags == 0/
{
	@num["TCP_null_scan", args[2]->ip_saddr, args[3]->tcps_lport] = count();
}
tcp:::receive
/args[4]->tcp_flags == (TH_RST||TH_ECE||TH_CWR||TH_URG||TH_PUSH||TH_FIN||TH_SYN||TH_ACK)/
{
	@num["TCP_Xmas_scan", args[2]->ip_saddr, args[3]->tcps_lport] = count();
}

dtrace:::END
{
	printf("Possible scan events: \n\n");
	printf("%-20s %-24s %-28s %8s\n","TYPE", "HOST", "PORT", "COUNT");
	printa("%-20s %-24s %-28d %@8d\n", @num);
}
