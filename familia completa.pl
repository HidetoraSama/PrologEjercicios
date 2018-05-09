esposode('teresa','carlos 1').
esposode('carlos 1','teresa').
padrede('pedro','carlos1').
padrede('isabel','carlos1').
esposode('pedro','isabel').
esposode('isabel','pedro').
padrede('danielo','teresa').
padrede('daniela','teresa').
esposode('danielo','daniela').
esposode('danela','danielo').

padrede('claudia','cristian').
padrede('claudia','carlos 3').
padrede('graciela','claudia').
padrede('graciela','marta').
esposode('marta','jorgeM').
esposode('jorgeM','marta').
padrede('marta','camila').
padrede('marta','diego').
padrede('graciela','esperanza').
padrede('graciela','adriana').
padrede('adriana','santiago').
padrede('adriana','andres').
padrede('adriana','jhon').
padrede('graciela','ana').
esposode('ana','jorgeL').
esposode('jorgeL','ana').
padrede('ana','daniel').
padrede('ana','brayan').
padrede('graciela','jairo 2').
padrede('jairo 1','claudia').
padrede('jairo 1','marta').
padrede('jairo 1','esperanza').
padrede('jairo 1','adriana').
padrede('jairo 1','ana').
padrede('jairo 1','jairo 2').
esposode('graciela','jairo 1').
esposode('jairo 1','graciela').
esposode('filo','rodrigo').
esposode('rodrigo','filo').
padrede('filo','graciela').
padrede('rodrigo','graciela').
esposode('juan','maria').
esposode('maria','juan').
padrede('carlos 2','cristian').
padrede('carlos 2','carlos 3').
padrede('carlos 1','carlos 2').
padrede('carlos 1','olga').
padrede('teresa','carlos 2').
padrede('teresa','olga').
padrede('juan','jairo 1').
padrede('maria','jairo 1').

hijode(A,B):-padrede(B,A).
nietode(A,B):-padrede(B,C),padrede(C,A).
abuelode(A,B):-nietode(B,A).
bisnietode(A,B):-nietode(C,B),padrede(C,A).
bisabuelode(A,B):-bisnietode(B,A).
hermanode(A,B):-padrede(C,A),padrede(C,B).
tiode(A,B):-padrede(C,B),hermanode(C,A).
sobrinode(A,B):-tiode(B,A).
primode(A,B):-tiode(C,A),padrede(C,B).
suegrode(A,B):-padrede(A,C),esposode(C,B).
yernoynuerade(A,B):-suegrode(B,A).
cuñadode(A,B):-hermanode(A,C),esposode(C,B).
cuñadode(A,B):-hermanode(B,C),esposode(C,A).

feliz(A):-not(esposode(A,B)).