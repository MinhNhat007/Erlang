-module(bst).
-compile([export_all]).
%-export([createBST/0, insertBST/2]).

insertBST([], Data) -> [Data, [], []];
insertBST([Root, Left, Right], Data) ->
	if 
		Data =< Root -> [Root, insertBST(Left, Data), Right];
		Data >  Root -> [Root, Left, insertBST(Right, Data)]
	end.
	

showBST([]) -> io:fwrite("nil,");
showBST([Root, Left, Right]) ->
	io:fwrite("(~B,(", [Root]),
	showBST(Left),
	showBST(Right),
	io:fwrite(")").
	
createBST() -> [].
createBST(Data) -> 
	insertBST(createBST(), Data).