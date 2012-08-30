-module(day1hw).
-export([strlen/1]).
-export([countTen/0]).
-export([countTen/1]).
-export([printStuff/1]).
 
strlen([]) -> 0;
strlen([Head|Tail]) -> 1 + strlen(Tail).
 
countTen() -> countTen(0).
countTen(10) -> 10;
countTen(X) -> io:fwrite("~B~n",[X]), countTen(X + 1).
 
printStuff(success) -> io:fwrite("~w~n",[success]);
printStuff({error, Message}) -> io:fwrite("error: ~s ~n", [Message]).