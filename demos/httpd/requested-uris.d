#!/usr/sbin/dtrace -s
http*:::request-start
{
  @[args[1]->hri_uri] = count();
}