import cancion.*
class Album {
	var fechaDeLanzamiento
	var unidadesEnVenta
	var unidadesVendidas
	var canciones
	
	constructor (unaFecha, unasUnidadesEnVenta, unasUnidadesVendidas, unasCanciones) {
		fechaDeLanzamiento = unaFecha
		unidadesEnVenta = unasUnidadesEnVenta
		unidadesVendidas = unasUnidadesVendidas
		canciones = unasCanciones
	}
	
	method unidadesEnVenta(){
		return unidadesEnVenta
	}

	method unidadesVendidas () {
		return unidadesVendidas
	}

	method esAlbumMinimalista () {
		return canciones.all({cancion => cancion.esCorta()})
	}
	
	method cancionesQueDicen(palabra){
		return canciones.filter({cancion => cancion.dice(palabra)})
	}
	
	method cancionMasLarga() {
		return canciones.max({cancion => cancion.cantidadDePalabras()})
	}
	
	method duracion () {
		return canciones.sum({cancion => cancion.duracion()})
	}

	method tieneBuenaVenta(){
		return (unidadesEnVenta * 0.75) < unidadesVendidas
	}

	method estaEnElAlbumLaCancion(cancion){
		return canciones.contains(cancion)
	}

	method mayorSegun(unaCancion, otraCancion, criterio) {
		return #{unaCancion, otraCancion}.max(criterio)
	}

	method mayorCancionAlbumSegun(criterio){
		return canciones.max(criterio)
	}
}
