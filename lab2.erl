-module (lab2).

-compile([export_all]).

%-----------------------------------map implements
%implement map_append
map_append(Key, Value, Map) -> 
	Map#{Key => Value}.

%implement map_update
map_update(Key, Value, Map) ->
	Map#{Key := Value}.
	
%------------------------------------implement map_display

%implement display for one
map_display_one(Key, Value) -> 
   io:fwrite("~s => ~w~n",[Key,Value]).

%implement display for all
map_display(Map) ->
	maps:map(map_display_one, Map).

%------------------------------implement count word in file

%split binary to tokens
split_to_tokens(DataFile) -> binary:split(DataFile, [<<" ">>], [global]).

%remove all duplicates
remove_duplicates(Tokens) ->
	Set = sets:from_list(Tokens),
	sets:to_list(Set).

%count word in a list
count(Word, List) -> count(Word, List, 0).
count(_, [], Count) -> Count;
count(Word, [Word|Rest], Count) -> count(Word, Rest, Count + 1);
count(Word, [_|Rest], Count) -> count(Word, Rest, Count).

%build map
build_map(DataFile) ->
	Tokens = split_to_tokens(DataFile),
	Unique_tokens = remove_duplicates(Tokens),
	Result = [{Unique_token, count(Unique_token, Tokens)} || Unique_token <- Unique_tokens],
	maps:from_list(Result).

%main function of reading and building
read_build_map(FileName) ->
	{ok, DataFile} = file:read_file(FileName),
	build_map(DataFile).
	
	
