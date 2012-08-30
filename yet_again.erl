 -module(yet_again).
 -export([fact/1]).
 -export([fib/1]).
 
 fact(1) -> 1;
 fact(X) -> X * fact(X - 1).
 
fib(0) -> 1;
fib(1) -> 1;
fib(X) -> fib(X-1) + fib(X-2).