object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
	method bulto() { return 1 }
	method modificar() {  }
}

object bumblebee {
	var esRobot = false
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (esRobot) { 30 } else { 15 }  }
	method transformar() { esRobot = not esRobot }
	method bulto() { return 2 }
	method esRobot() {return esRobot}
	method modificar() { self.transformar() }
}
object paqueteLadrillos{
	var property pesoLadrillo = 2
	var property cantLadrillos = 0
	
	method peso() {return pesoLadrillo * cantLadrillos }
	method cantLadrillos() {return cantLadrillos}
	method agregarLadrillos(cantidad) {cantLadrillos += cantidad}
	method nivelPeligrosidad() { return 2 }
	method bulto() { 
		if (cantLadrillos <= 100) {return 1}
		else if (cantLadrillos > 100 && cantLadrillos <= 300 ) { return 2 }
		else {return 3}
	}
	method modificar() { cantLadrillos += 12 }
}
object arena{
	var property peso = 0
	method peso() { return peso }
	method agregarArena(cantidad) { peso += cantidad }
	method nivelPeligrosidad() { return 1 }
	method bulto() { return 1 }
	method modificar() { peso += 20 }
}
object bateriaAntiaera{
	var property estaCargado = false
	method peso() {
		if (estaCargado) { return 300 }
		else { return 200 }
	}
	method cargarMisiles(){ estaCargado = true }
	method descargarMisiles(){ estaCargado = false }
	method nivelPeligrosidad() {
		if (estaCargado){ return 100 }
		else { return 0 }
	}
	method bulto(){
		if (estaCargado) { return 2}
		else { return 1 }
	}
	method modificar() { self.cargarMisiles() }
}
object contenedorPortuario{
	const property cosas = []
	
	method meter(cosa) { cosas.add(cosa) }
	method sacar(cosa){ cosas.remove(cosa) }
	method peso() { return 100 + cosas.sum({cosa => cosa.peso()}) }
	method nivelPeligrosidad() { return cosas.max({cosa => cosa.nivelPeligrosidad()}).nivelPeligrosidad() }
	method bulto() { return ( 1 + self.cantidadDeBultos() )}
	method cantidadDeBultos() { return cosas.sum({cosa => cosa.bulto()}) }
	method modificar() { cosas.forEach({cosa => cosa.modificar()}) }
}
object residuosRadioactivos{
	var property peso = 0
	method peso() { return peso }
	method agregarResiduos(cantidad) { peso += cantidad }
	method nivelPeligrosidad() { return 200 }
	method bulto() { return 1 }
	method modificar() { peso += 15 }
}
object embalajeDeSeguridad{
	var property peso = null
	var property nivelPeligrosidad = null
	method embalar(cosa){ peso = cosa.peso() ; nivelPeligrosidad = cosa.nivelPeligrosidad()}
	method peso(){ return peso }
	method nivelPeligrosidad(){ return nivelPeligrosidad }
	method bulto() { return 2 }
	method modificar() {  }
}

	