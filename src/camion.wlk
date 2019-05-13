import cosas.*

object camion {
	const property cosas = []
	var property pesoTotal = 1000
	
	method cargar(unaCosa) {cosas.add(unaCosa); unaCosa.modificar()}
	method descargar(unaCosa) {cosas.remove(unaCosa)}
	method pesoTotal() {return pesoTotal + cosas.sum({cosa => cosa.peso()})}
	method estaExcedido() {return self.pesoTotal() > 2500}
	method objetosPeligrosos(nivel) {
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel})
	}
	method objetosMasPeligrososQue(unaCosa){
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > unaCosa.nivelPeligrosidad()})
	}
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return cosas.all({cosa => cosa.nivelPeligrosidad() >= nivelMaximoPeligrosidad})
	}
	method tieneAlgoQuePesaEntre(min, max){	
		return cosas.filter({cosa => (cosa.peso() >= min && cosa.peso() <= max)})
	}
	method cosaMasPesada(){	return cosas.max ({cosa => cosa.peso()}) }
	method totalBultos() { return cosas.sum({cosa => cosa.bulto()}) }
	method pesos (){ return cosas.map({cosa => cosa.peso()}) }
}
