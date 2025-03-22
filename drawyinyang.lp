
#program display.
#const csize=30.
_rows(N) :- gridsize(N).
_cols(N) :- gridsize(N).
&display{window,h=H,w=W,caption="Yin Yang puzzle"} :- H=csize*NR+1, W=csize*NC+1, _rows(NR), _cols(NC).
&display{line,x1=X,y1=0,x2=X,y2=Y,width=1,color=lightgray} :- Y=csize*NC, R=0..NR, X=csize*R, _rows(NR), _cols(NC).
&display{line,x1=0,y1=Y,x2=X,y2=Y,width=1,color=lightgray} :- X=csize*NR, C=0..NC, Y=csize*C, _rows(NR), _cols(NC).
&display{circle,x=X1,y=Y1,r=R,width=2,color=black} :- _drawcircle(X,Y,_),R=csize/2-2,X1=Y*csize+R+2,Y1=X*csize+R+2.
&display{circle,x=X1,y=Y1,r=R,width=0,color=C} :- _drawcircle(X,Y,C),R=csize/2-2,X1=Y*csize+R+2,Y1=X*csize+R+2.


