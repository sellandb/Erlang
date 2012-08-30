-module(day2hw).
-export([hashVal/2]).
-export([tttWinner/1]).
-export([tttWinnerO/1]).
-export([tttWinnerX/1]).
-export([tttWinnerSection/5]).
-export([tttWinnerCat/1]).


hashVal(Key, []) -> nothing;
hashVal(Key, [{Hkey, Hval}|Tail]) -> if Key == Hkey -> Hval;
										true -> hashVal(Key, Tail)
										end.

%List comperhension practice										
%ShoppingList = [{milk, 2, 3.50}, {cereal, 4, 1.50}, {bacon, 1, 4.5}].
%ShoppingTotals = [{Item, Quant * Price}|| {Item, Quant, Price} <- ShoppingList].

tttWinner(Board) ->
Cat = tttWinnerCat(Board),
O = tttWinnerO(Board),
X = tttWinnerX(Board),
if Cat -> cat;
	O -> winnerO;
	X -> winnerX;
	true -> noWinner
end.

tttWinnerO(Board) -> 
W1 = tttWinnerSection(Board, 1,2,3, o),
W2 = tttWinnerSection(Board, 4,5,6, o),
W3 = tttWinnerSection(Board, 7,8,9, o),
W4 = tttWinnerSection(Board, 1,4,7, o),
W5 = tttWinnerSection(Board, 1,4,7, o),
W6 = tttWinnerSection(Board, 3,6,9, o),
W7 = tttWinnerSection(Board, 1,5,9, o),
W8 = tttWinnerSection(Board, 3,5,7, o),
if W1 -> true;
	W2 -> true;
	W3 -> true;
	W4 -> true;
	W5 -> true;
	W6 -> true;
	W7 -> true;
	W8 -> true;
	true -> false
end.

tttWinnerX(Board) -> 
W1 = tttWinnerSection(Board, 1,2,3, x),
W2 = tttWinnerSection(Board, 4,5,6, x),
W3 = tttWinnerSection(Board, 7,8,9, x),
W4 = tttWinnerSection(Board, 1,4,7, x),
W5 = tttWinnerSection(Board, 1,4,7, x),
W6 = tttWinnerSection(Board, 3,6,9, x),
W7 = tttWinnerSection(Board, 1,5,9, x),
W8 = tttWinnerSection(Board, 3,5,7, x),
if W1 -> true;
	W2 -> true;
	W3 -> true;
	W4 -> true;
	W5 -> true;
	W6 -> true;
	W7 -> true;
	W8 -> true;
	true -> false
end.

tttWinnerSection(Board, S1, S2, S3, P) -> 
P1 = lists:nth(S1, Board),
P2 = lists:nth(S2, Board),
P3 = lists:nth(S3, Board),
if (P1==P) and (P2==P) and (P3==P) -> true;
	true -> false
end.

tttWinnerCat([]) -> true;												 
tttWinnerCat([H|T]) ->	if H == e -> false;
							true -> tttWinnerCat(T)
							end.