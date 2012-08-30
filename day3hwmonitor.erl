-module(day3hwmonitor).
-export([loop/0]).

loop() ->
	process_flag(trap_exit, true),
	
	receive
		new -> 
			io:format("Starting a new translator~n"),
			register(translator, spawn_link(fun day3hw:loop/0)),
			loop();
			
		restart -> 
			io:format("Restarting a translator~n"),
			register(translator, spawn_link(fun day3hw:loop/0)),
			translator ! restart,
			loop();
		
		{'EXIT', From, Reason} ->
			io:format("The process shut down, I am restarting it~n"),
			self() ! restart,
			loop()
	end.
			