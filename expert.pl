:-include('facts.pl').
:-include('rules.pl').

printlaptop(H):-
    brand(H,A),
    model(H,B),
    ram(H,C),
    hd_type(H,D),
    hd_size(H,E),
    screen_size(H,F),
    price(H,G),
    processor_brand(H,I),
    processor_model(H,J),
    clock_speed(H,K),
    gc_brand(H,L),
    gc_size(H,M),
    os(H,N),
    weight(H,O),
    write(A),
    write(' '),
    write(B),
    write(' '),write(C),write(' '),write(D),
    write(' '),write(E),write(' '),
    write(F),write(' '),write(G),write(' '),
    write(I),write(' '),write(J),write(' '),
    write(K),write(' '),write(L),
    write(' '),write(M),write(' '),write(N),write(' '),write(O),put(10).

check([],_,_,[]).
check([H|T],S,P,[H|Result]) :-
    S=:=1,
    price(H,Q),
    Q=<P,
    isgaming(H),
    printlaptop(H),
    check(T,S,P,Result).

check([H|T],S,P,[H|Result]) :-
    S=:=2,
    price(H,Q),
    Q=<P,
    isdev(H),
    printlaptop(H),
    check(T,S,P,Result).
check([H|T],S,P,[H|Result]) :-
    S=:=3,
    price(H,Q),
    Q=<P,
    isclerk(H),
    printlaptop(H),
    check(T,S,P,Result).

check([H|T],S,P,[H|Result]) :-
    S=:=4,
    price(H,Q),
    Q=<P,
    ishome(H),
    printlaptop(H),
    check(T,S,P,Result).

check([_|T],S,P,Result) :-
    check(T,S,P,Result).
l(0,[]).
l(N,[N|L]):-
    N>0,
    N1 is N-1,
    l(N1,L).
test(M) :-
    write('Type of laptop: 1 for gaming, 2 for dev, 3 for clerk, 4 for home '),
    read(B),
    integer(B),
    write('Input Upper bound on Price '),
    read(P),
    integer(P),
    P>0,
    l(170,L),
    check(L,B,P,M).