isgaming(X):-
    ram(X,R),R>=4,
    hd_size(X,H),H>=512,
    screen_size(X,S),S>15,
    (processor_brand(X,intel),(processor_model(X,"i5");processor_model(X,"i3");processor_model(X,"i7")));processor_brand(X,amd),
    gc_size(X,G),G>=2,
    os(X,"windows").

isdev(X):-
    ram(X,R),R>=8,
    hd_size(X,H),H>=512,
    screen_size(X,S),S>14,
    (processor_brand(X,intel),(processor_model(X,"i5");processor_model(X,"i3"))),
    gc_size(X,G),G>=1.
