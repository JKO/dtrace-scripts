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
/args[4]->tcp_flags != 0/
/*#(TH_RST|TH_ECE|TH_CWR|TH_URG|TH_PUSH|TH_FIN|TH_SYN|TH_ACK)*/
{
  trace("TYPE FLAGS");
  trace(args[2]->ip_saddr);trace(args[3]->tcps_lport);trace(args[4]->tcp_flags);
}
