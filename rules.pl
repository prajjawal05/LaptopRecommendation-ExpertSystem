isgaming(X):-
    ram(X,R),R>=8,
    hd_size(X,H),H>=512,
    screen_size(X,S),S>15,
    (processor_brand(X,intel),(processor_model(X,"i5");processor_model(X,"i3");processor_model(X,"i7")));processor_brand(X,amd),
    gc_size(X,G),G>=2,
    os(X,"windows").

isdev(X):-
    ram(X,R),R>=8,
    hd_size(X,H),H>=512,
    screen_size(X,S),S>14,
    clock_speed(X,C),C>=2.3, 
    (processor_brand(X,intel),(processor_model(X,"i5");processor_model(X,"i3"))),
    gc_size(X,G),G>=1.
    
isclerk(X):-
    ram(X,R),R>=2,
    hd_size(X,H),H>=512,
    screen_size(X,S),S>12,
    processor_brand(X,intel),
    os(X,"windows").

ishome(X):-
    ram(X,R),R>=4,
    hd_size(X,H),H>=512,
    screen_size(X,S),S>13,
    os(X,"windows");os(X,"mac").

compare_hd_type(P,Q):-
    A = 1, B = 2, B>A,
    hd_type(P,R),
    hd_type(Q,S),
    X = R, Y= S,
    (X == "ssd", Y == "hdd").

compare_gc_size(P,Q):-
    gc_size(P,R),
    gc_size(Q,S),
    X = R, Y= S,
    X>Y.

compare_weight(P,Q):-
    weight(P,R),
    weight(Q,S),
    X = R, Y= S,
    X>Y.

compare_screen_size(P,Q):-
    screen_size(P,R),
    screen_size(Q,S),
    X = R, Y= S,
    X>Y.

compare_processors_brand(P,Q):-
    A = 1, B = 2, B>A,
    processor_brand(P,R),
    processor_brand(Q,S),
    X = R, Y= S,
    (X == "intel", Y == "amd").

compare_graphics(P,Q):-
    A = 1, B = 2, B>A,
    gc_brand(P,R),
    gc_brand(Q,S),
    X = R, Y= S,
    ((X == "nvidia", Y == "amd");
    (X == "amd", Y == "intel")).

compare_processors(P,Q):-
    A = 1, B = 2, B>A,
    processor_model(P,R),
    processor_model(Q,S),
    X = R, Y= S,
    ((X == "i5", Y == "i3");
    (X == "i7", Y == "i5")).


compare_laptop(X,Y):-
    A = 0, B = 0,
    (compare_processors_brand(X,Y) -> A=A+1 ; B=B+1),
    (compare_processors(X,Y) -> A=A+1 ; B=B+1),
    (compare_graphics(X,Y) -> A=A+1 ; B=B+1),
    (compare_gc_size(X,Y) -> A=A+1 ; B=B+1),
    (compare_hd_type(X,Y) -> A=A+1 ; B=B+1),
    (compare_screen_size(X,Y) -> A=A+1 ; B=B+1),
    (compare_weight(X,Y) -> A=A+1 ; B=B+1),
    write(A),write(B).

