-module(day3hw).
-export([loop/0,translate/2]).
 
loop() ->
			receive
				{From, "moon"} -> 
					From ! "farm",
					loop();
				
				{From, "house"} -> 
					From ! "cats",
					loop();
				
				restart ->	
					io:format("I was restarted ~n"),
					loop();
					
				{From, _} -> 
					From ! "I don't know this, I am going to shut down",
					exit({day3hw, die, at, erlang:time()})
			end.
			
translate(To, Word) ->
	To ! {self(), Word},
	receive
		Translation -> Translation
	end.