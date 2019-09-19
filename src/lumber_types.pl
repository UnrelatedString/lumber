/*
Lumber tries to make stack management easy with a sizeable supply of
semantically significant subtypes. That's not to say it succeeds.
*/

:- module(lumber_types,
          [lt_is/3]).
:- use_module(library(clpfd)).

% General case: if the type of something is T, then it's a T.
lt_is(T, X, V) :-
    X =.. [T, V].

% Numerical type hierarchy
lt_is(complex, X, c(R,0)) :-
    lt_is(real, X, R).
lt_is(real, X, V) :-
    lt_is(rat, X, N/D), V #= N/D;
    lt_is(float, X, V).
lt_is(rat, X, I/1) :-
    lt_is(int, X, I).
lt_is(int, X, V) :-
    lt_is(nat, X, V).

% Sequence type hierarchy
% this is a good opportunity to start considering vectorization behavior.
lt_is(seq, X, V) :-
    lt_is(infinite, X, V); % Not 100% sure how I'll do non-cyclic infinite lists
    lt_is(list, X, V).
lt_is(list, X, V) :-
    lt_is(string, X, S);
    lt_is(stack, X, S).

% TODO: some sort of alternative forced casting predicate?
