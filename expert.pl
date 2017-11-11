printlaptop(H):-
    brand(H,A),
    model(H,B),
    write(H),write(' '),
    write(A), write(' '),
    write(B),nl.

check([],_,[]).
check([H|T],S,[H|Result]) :-
    S=:=1,
    printlaptop(H),
    isgaming(H),
    check(T,S,Result).

check([H|T],S,[H|Result]) :-
    S=:=2,
    printlaptop(H),
    isdev(H),
    check(T,S,P,Result).
check([H|T],S,[H|Result]) :-
    S=:=3,
    printlaptop(H),
    isclerk(H),
    check(T,S,Result).

check([H|T],S,[H|Result]) :-
    S=:=4,
    printlaptop(H),
    ishome(H),
    check(T,S,Result).

check([_|T],S,Result) :-
    check(T,S,Result).


test() :-
    write('Type of laptop: 1 for gaming, 2 for dev, 3 for clerk, 4 for home '),
    nl,
    read(B),
    integer(B),
    write('Input Upper bound on Price '),
    nl,
    read(P),
    integer(P),
    P>0,
    input(P,L),
	bubble_sort(L,X),
    %numlist(1,168,L),
	check(X,B,M).
