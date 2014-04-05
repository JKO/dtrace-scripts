#!/usr/sbin/dtrace -s
http*:::request-done
{
  @[args[1]->hri_respcode] = count();
}