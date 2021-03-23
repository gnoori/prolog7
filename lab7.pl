% Guzel Noori.
% CS 362 - Lab 7.

% Jean Johnsons history.

year([], []).
year([HY|TY], [HX|TX]) :- HX = [HY, _, _, _], year(TY, TX).

claimedJobs([], _).
claimedJobs([H|T], L) :-
    member([_, H, _, _], L),
    claimedJobs(T, L).

jobRegions([], _).
jobRegions([H|T], L) :-
    member([_, _, H, _], L),
    jobRegions(T, L).

actualJobs([], _).
actualJobs([H|T], L) :-
    member([_, _, _, H], L),
    actualJobs(T, L).

% HINTS provided.

firstHint(X) :-
    member([_, foreign_legionnaire, eastAfrica, _], X).

secondHint(X) :-
    member([Y1, _, _, mail_man], X),
    member([Y3, _, _, server], X),
    Y3 is Y1 + 3.

thirdHint(X) :-
    member([1976, _, middleEast, _], X).

forthHint(X) :-
    member([Y1, treasure_hunter, _, hotel_page], X),
    member([Y3, _, sovietUnion, _], X),
    Y3 is Y1 + 3.

fifthHint(X) :-
    member([1982, _, _, taxi_driver], X).

sixthHint(X) :-
    member([Y1, spy, _, _], X),
    member([Y2, _, _, server], X),
    Y1 \= Y2.

puzzle(X) :-
    length(X, 4),
    year([1973, 1976, 1979, 1982], X),
    claimedJobs([foreign_legionnaire, spy, bodyguard, treasure_hunter], X),
    jobRegions([middleEast, eastAfrica, sovietUnion, southAmerica], X),
    actualJobs([mail_man, hotel_page, server, taxi_driver], X),
    firstHint(X),
    secondHint(X),
    thirdHint(X),
    forthHint(X),
    fifthHint(X),
    sixthHint(X).