% Currently, each bin is just a list. Eventually they'll do some sort of cycling, probably.

:- module(lumber_bins,
          [asse/0]).

asse :- assertz(y),export(y/0).
