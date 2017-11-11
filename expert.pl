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
	
	
test(M) :-
    write('Type of laptop: 1 for gaming, 2 for dev, 3 for clerk, 4 for home '),
    read(B),
    integer(B),
    write('Input Upper bound on Price '),
    read(P),
    integer(P),
    P>0,
    input(P,L),
	bubble_sort(L,X),
    %numlist(1,168,L),
	check(L,B,M).