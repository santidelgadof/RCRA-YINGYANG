% encode.py examples/domXX.txt examples/domXX.lp
% decode.py yinyangKB.lp examples/domXX.lp solXX.txt

% Cada celda un solor (blanco o negro)
{ color(Y,X,black); color(Y,X,white) } = 1 :- cell(Y,X), not init(Y,X,_).

% Celdas iniciales fijas (de los ejemplos)
color(Y,X,C) :- init(Y,X,C).


% Prohíbe cualquier 2x2 de blanco o negro
block2x2(Y,X,C) :-
    cell(Y,X), cell(Y+1,X), cell(Y,X+1), cell(Y+1,X+1),
    color(Y,X,C), color(Y+1,X,C), color(Y,X+1,C), color(Y+1,X+1,C).
:- block2x2(Y,X,C).

% Elegimos una celda raíz para cada color
1 { root(black,Y,X) : color(Y,X,black) } 1.
1 { root(white,Y,X) : color(Y,X,white) } 1.

% Alcanzable si es raíz
reachable(C,Y,X) :- root(C,Y,X).

% Vecinos ortogonales
neighbor(Y,X,Y+1,X) :- cell(Y,X), cell(Y+1,X).
neighbor(Y,X,Y-1,X) :- cell(Y,X), cell(Y-1,X).
neighbor(Y,X,Y,X+1) :- cell(Y,X), cell(Y,X+1).
neighbor(Y,X,Y,X-1) :- cell(Y,X), cell(Y,X-1).

% Propagamos a celdas del mismo color conectadas
reachable(C,Y2,X2) :- reachable(C,Y,X), neighbor(Y,X,Y2,X2), color(Y,X,C), color(Y2,X2,C).

% Prohibido que haya celdas no alcanzables
:- color(Y,X,C), not reachable(C,Y,X).

% Dibujar para el decode
_drawcircle(Y,X,C) :- color(Y,X,C).

#show _drawcircle/3.
