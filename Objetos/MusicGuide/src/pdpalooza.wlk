import cancion.*
import lunaPark.*
import Presentacion.*
import Condicion.*

object pdpalooza inherits Presentacion(lunaPark, new Date(15, 12, 2017)) {

	const alicia = new Cancion("Canci�n de Alicia en el pa�s", 510, "Qui�n sabe Alicia, este pa�s no estuvo hecho porque s�. Te vas a ir, vas a salir pero te quedas, �d�nde m�s vas a ir? Y es que aqu�, sabes el trabalenguas, trabalenguas, el asesino te asesina, y es mucho para ti. Se acab� ese juego que te hac�a feliz.")
	var condiciones = [
		new Condicion({artista => artista.habilidad() >= 70}, "No se puede aceptar a este musico porque tiene menos de 70 de habilidad"),
		new Condicion({artista => not artista.noTieneCanciones()}, "No se puede aceptar a este musico porque no compuso canciones"),
		new Condicion({artista => artista.interpretaBien(alicia)}, "No se puede aceptar a este musico porque no interpreta bien 'alicia'")
	]
	
	method agregarCondicion(condicion) {
		condiciones.add(condicion)
	}
	
	method cumpleCondiciones(unArtista) {
		condiciones.forEach({condicion => 
			if(!condicion.evaluar(unArtista)) {
				throw new Exception(condicion.mensaje())
			}
		})
	}
	
	method agregarArtista(unArtista) {
		self.cumpleCondiciones(unArtista)
		artistas.add(unArtista)
	}
	
}