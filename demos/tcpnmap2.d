#!/usr/sbin/dtrace -s
tcp:::accept-refused
{
 trace("Refused -- :)");
 trace(args[2]->ip_daddr);trace(args[4]->tcp_sport);
}
tcp:::receive
/args[4]->tcp_flags == 0/
{
	trace("Flag 0");
	trace(args[2]->ip_saddr);trace(args[3]->tcps_lport);trace(args[4]->tcp_flags);
}
tcp:::receive
/*
 args[4]->tcp_flags == (TH_RST|TH_ECE|TH_CWR|TH_URG|TH_PUSH|TH_FIN|TH_SYN|TH_ACK)
*/
{
    printf("%s %s %s", args[4]->tcp_flags & TH_FIN ? "FIN|" : "", stringof(args[3]->tcps_lport), stringof(args[2]->ip_saddr));
    printf("%s %s %s", args[4]->tcp_flags & TH_SYN ? "SYN|" : "", stringof(args[3]->tcps_lport), stringof(args[2]->ip_saddr));
    printf("%s %s %s", args[4]->tcp_flags & TH_RST ? "RST|" : "", stringof(args[3]->tcps_lport), stringof(args[2]->ip_saddr));
    printf("%s %s %s", args[4]->tcp_flags & TH_PUSH ? "PUSH|" : "", stringof(args[3]->tcps_lport), stringof(args[2]->ip_saddr));
    printf("%s %s %s", args[4]->tcp_flags & TH_ACK ? "ACK|" : "", stringof(args[3]->tcps_lport), stringof(args[2]->ip_saddr));
    printf("%s %s %s", args[4]->tcp_flags & TH_URG ? "URG|" : "", stringof(args[3]->tcps_lport), stringof(args[2]->ip_saddr));
    printf("%s %s %s", args[4]->tcp_flags & TH_ECE ? "ECE|" : "", stringof(args[3]->tcps_lport), stringof(args[2]->ip_saddr));
    printf("%s %s %s", args[4]->tcp_flags & TH_CWR ? "CWR|" : "", stringof(args[3]->tcps_lport), stringof(args[2]->ip_saddr));
    printf("%s %s %s", args[4]->tcp_flags == 0 ? "null " : "", stringof(args[3]->tcps_lport), stringof(args[2]->ip_saddr));
    printf("\b)\n");
}
