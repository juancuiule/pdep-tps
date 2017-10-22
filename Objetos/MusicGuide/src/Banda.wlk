import musico.*
import Presentacion.*

class Banda {
	var integrantes = #{}
	var representante
	
	constructor(unosMusicos,unRepresentante){
		integrantes = unosMusicos
		representante = unRepresentante
	}
	
	method cuantoCobran(){   //no entendi el tema cobrador en la class musico
		return integrantes.sum({integrante=>integrante.cobra()}) + representante.cobra()
	}
	method estanEnGrupo(){
		return integrantes.all({integrante => integrante.estaEnGrupo()})
	
		
	method habilidad(){
		if(integrantes.estanEnGrupo()){
		return integrantes.sum({integrante=>integrante.habilidad()}) * 1.1
	}
	}
	
	method discosEditados(){
		return integrantes.map({integrante => integrante.discosHechos()})
	}
	
	method puedenTocar(unaCancion){
		return integrantes.all({integrante => integrante.interpretaBien(unaCancion)})

}

class Representante{
	var precio = 0
	
	constructor(precioQueCobra){
		precio = precioQueCobra
	}
	
	method cobra(){
		return precio
	}
	

}