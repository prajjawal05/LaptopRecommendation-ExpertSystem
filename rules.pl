:- discontiguous(chik/3).

isgaming(X):-
    ram(X,R),R>=8,
    hd_size(X,H),H>=512,
    screen_size(X,S),S>15,
    ((processor_brand(X,intel),(processor_model(X,'i5');processor_model(X,'i3');processor_model(X,'i7')));processor_brand(X,'amd')),
    gc_size(X,G),G>=2,
    os(X,'windows').

isdev(X):-
    ram(X,R),R>=8,
    hd_size(X,H),H>=512,
    screen_size(X,S),S>14,
    clock_speed(X,C),C>=2.3,
    (processor_brand(X,'intel'),(processor_model(X,'i5');processor_model(X,'i3'))),
    gc_size(X,G),G>=1.

isclerk(X):-
    ram(X,R),R>=2,
    hd_size(X,H),H>=512,
    screen_size(X,S),S>12,
    processor_brand(X,'intel'),
    os(X,'windows').

ishome(X):-
    ram(X,R),R>=4,
    hd_size(X,H),H>=512,
    screen_size(X,S),S>13,
    os(X,'windows');os(X,'mac').

compare_hd_type(P,Q):-
    A = 1, B = 2, B>A,
    hd_type(P,R),
    hd_type(Q,S),
    X = R, Y= S,
    (X = 'ssd', Y = 'hdd').

compare_gc_size(P,Q):-
    gc_size(P,R),
    gc_size(Q,S),
    X = R, Y= S,
    X>=Y.

compare_gc_size(P,Q):-
    hd_size(P,R),
    hd_size(Q,S),
    X = R, Y= S,
    X>=Y.

compare_weight(P,Q):-
    weight(P,R),
    weight(Q,S),
    X = R, Y= S,
    X>=Y.

compare_price(P,Q):-
    price(P,R),
    price(Q,S),
    X = R, Y= S,
    X>=Y.


compare_screen_size(P,Q):-
    screen_size(P,R),
    screen_size(Q,S),
    X = R, Y= S,
    X>=Y.

compare_processors_brand(P,Q):-
    A = 1, B = 2, B>A,
    processor_brand(P,R),
    processor_brand(Q,S),
    X = R, Y= S,
    ((X = 'amd', Y = 'amd');
	(X = 'intel' , Y = 'amd');
	(X = 'intel' , Y = 'intel')).

compare_graphics(P,Q):-
    A = 1, B = 2, B>A,
    gc_brand(P,R),
    gc_brand(Q,S),
    X = R, Y= S,
    ((X = 'nvidia', Y = 'amd');
	(X = 'nvidia' , Y = 'intel');
	(X = 'intel' , Y = 'intel');
	(X = 'nvidia' , Y = 'nvidia');
	(X = 'amd' , Y = 'amd');
    (X = 'amd', Y = 'intel')).

compare_processors(P,Q):-
    A = 1, B = 2, B>A,
    processor_model(P,R),
    processor_model(Q,S),
    X = R, Y= S,
    ((X = 'i5', Y = 'i3');
    (X = 'i7', Y = 'i3');
    (X = 'i5', Y = 'i5');
    (X = 'i3', Y = 'i3');
    (X = 'i7', Y = 'i7');
    (X = 'i7', Y = 'i5')).

compare_laptop(X,Y):-
	compare_price(X,Y);
    compare_processors_brand(X,Y);
    compare_processors(X,Y);
    compare_gc_size(X,Y);
    compare_screen_size(X,Y).



bubble_sort(List,Sorted):-b_sort(List,[],Sorted).
b_sort([],Acc,Acc).
b_sort([H|T],Acc,Sorted):-bubble(H,T,NT,Max),b_sort(NT,[Max|Acc],Sorted).

bubble(X,[],[],X).
bubble(X,[Y|T],[Y|NT],Max):-compare_laptop(Y,X),bubble(X,T,NT,Max).
bubble(X,[Y|T],[X|NT],Max):-compare_laptop(X,Y),bubble(Y,T,NT,Max).

chik([],_,[]).
l(0,[]).

l(N,[N|L]):-
    N>0,
    N1 is N-1,
    l(N1,L).

chik([H|T],P,[H|Result]) :-
    price(H,Q),
    Q=<P,
    chik(T,P,Result).

chik([_|T],P,Result) :-
    chik(T,P,Result).

input(P,M):-
    l(170,L),
    chik(L,P,M).
