% pareja(Persona, Persona)
pareja(marsellus, mia).
pareja(pumkin, honeyBunny).
pareja(bernardo, bianca).
pareja(bernardo, charo).

% trabajaPara(Empleador, Empleado).
trabajaPara(marsellus, vincent).
trabajaPara(marsellus, jules).
trabajaPara(marsellus, winston).
trabajaPara(Empleador, bernardo) :-
	trabajaPara(marsellus, Empleador),
	Empleador \= jules.
trabajaPara(Empleador, george) :-
	saleCon(Empleador, bernardo).

% saleCon/2
% Relaciona dos personas que están saliendo porque son pareja
saleCon(Quien, Cual) :- pareja(Quien, Cual).
saleCon(Quien, Cual) :- pareja(Cual, Quien).
% No es recursiva

%esFiel/1
saleConMasDeUno(Persona) :-
	saleCon(Persona, Alguien),
	saleCon(Persona, Otro),
	Alguien \= Otro.

esFiel(Persona) :-
	saleCon(Persona, _),
 	not(saleConMasDeUno(Persona)).

% acataOrden/2
% Si es recursiva

% Caso base
acataOrden(Empleador, Empleado) :- 
	trabajaPara(Empleador, Empleado).

% Caso recursivo
acataOrden(Empleador, Empleado) :-
	trabajaPara(Empleador, Otro),
	acataOrden(Otro, Empleado).

% personaje(Nombre, Ocupacion)
personaje(pumkin,     ladron([estacionesDeServicio, licorerias])).
personaje(honeyBunny, ladron([licorerias, estacionesDeServicio])).
personaje(vincent,    mafioso(maton)).
personaje(jules,      mafioso(maton)).
personaje(marsellus,  mafioso(capo)).
personaje(winston,    mafioso(resuelveProblemas)).
personaje(mia,        actriz([foxForceFive])).
personaje(butch,      boxeador).
personaje(bernardo,   mafioso(cerebro)).
personaje(bianca,     actriz([elPadrino1])).
personaje(elVendedor, vender([humo, iphone])).
personaje(jimmie,     vender([auto])).

% encargo(Solicitante, Encargado, Tarea). 
% las tareas pueden ser cuidar(Protegido), ayudar(Ayudado), buscar(Buscado, Lugar)
encargo(marsellus, vincent,   cuidar(mia)).
encargo(vincent,  elVendedor, cuidar(mia)).
encargo(marsellus, winston, ayudar(jules)).
encargo(marsellus, winston, ayudar(vincent)).
encargo(marsellus, vincent, buscar(butch, losAngeles)).
encargo(bernardo, vincent, buscar(jules, fuerteApache)).
encargo(bernardo, winston, buscar(jules, sanMartin)).
encargo(bernardo, winston, buscar(jules, lugano)).

amigo(vincent, jules).
amigo(jules, jimmie).
amigo(vincent, elVendedor).

% esPeligroso/1
esPeligroso(Persona):-
	personaje(Persona, Ocupacion),
	ocupacionPeligrosa(Ocupacion).

esPeligroso(Persona):-
	trabajaPara(Jefe,Persona),
	esPeligroso(Jefe).

ocupacionPeligrosa(mafioso(maton)).
ocupacionPeligrosa(ladron(Lugares)) :-
	member(licorerias, Lugares).

% sanCayetano/1
sanCayetano(Persona):-
	tieneAAlguienCerca(Persona, _),
	forall(tieneAAlguienCerca(Persona, Alguien), encargo(Persona, Alguien, _)).

sonAmigos(Persona, Alguien):- amigo(Persona, Alguien).
sonAmigos(Persona, Alguien):- amigo(Alguien, Persona).

tieneAAlguienCerca(Persona, Alguien):- sonAmigos(Persona, Alguien).
tieneAAlguienCerca(Persona, Alguien):- trabajaPara(Alguien, Persona).
tieneAAlguienCerca(Persona, Alguien):- trabajaPara(Persona, Alguien).

% nivelDeRespeto/2
nivelDeRespeto(Nombre, NivelDeRespeto) :-
	personaje(Nombre, Ocupacion),
	respetoPorOcupacion(Ocupacion, NivelDeRespeto).

nivelDeRespeto(vincent, 15).

respetoPorOcupacion(actriz(Peliculas), Respeto) :-
	length(Peliculas, CantidadDePeliculas),
	Respeto is CantidadDePeliculas / 10.
respetoPorOcupacion(mafioso(resuelveProblemas), 10).
respetoPorOcupacion(mafioso(capo), 20).

% respetabilidad/2
respetable(Nombre) :-
	personaje(Nombre, _),
	nivelDeRespeto(Nombre, Nivel),
	Nivel > 9.

noRespetable(Nombre) :-
	personaje(Nombre, _),
	not(respetable(Nombre)).

respetabilidad(Respetables, NoRespetables) :-
	findall(Nombre, respetable(Nombre), LosRespetables),
	length(LosRespetables, Respetables),
	findall(Nombre, noRespetable(Nombre), LosNoRespetables),
	length(LosNoRespetables, NoRespetables).

% masAtareado/1
cantidadDeEncargos(Nombre, Cantidad) :-
	personaje(Nombre, _),
	findall(Nombre, encargo(_, Nombre, _), ListaDeTareas),
	length(ListaDeTareas, Cantidad).

tieneMenosTareasQue(NombreDelPrimero, NombreDelSegundo) :-
	cantidadDeEncargos(NombreDelPrimero, CantidadDelPrimero),
	cantidadDeEncargos(NombreDelSegundo, CantidadDelSegundo),
	CantidadDelSegundo >= CantidadDelPrimero.

masAtareado(Quien) :-
	encargo(_, Quien, _),
	forall(encargo(_, Otro, _), tieneMenosTareasQue(Otro, Quien)).
