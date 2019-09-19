% implement do first, but I'll need to figure out what I'm doing about lines for that to make any sense

:- use_module(lumber_types).

lumber_sdump(Stack, Stack) :-
    write("\nSTACK DUMP:\n"),
    maplist(format("~w~n"),Stack),
    write("END\n\n").
