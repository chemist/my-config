#!/usr/bin/env escript
%% -*- erlang -*-
%%! -smp enable -sname fac 
-export([main/1]).

main([File]) ->
	rpc:call(corrector@calculate,ecf,check,[File]).
