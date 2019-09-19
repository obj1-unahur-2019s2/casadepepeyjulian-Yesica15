import cosas.* 
import cuentasBancarias.*

object casaDePepeYJulian {
	const cosas = []
	var cuentaBancaria
	
	method comprar(cosa){
		cosas.add(cosa)
		self.gastar(cosa.precio())
	}
	method cantidadDeCosasCompradas(){return cosas.size()}
	method tieneComida(){ return cosas.any({cosa => cosa.esComida()})}
	method vieneDeEquiparse(){return cosas.last().esElectrodomestico() or cosas.last().precio() > 5000}
	method esDerrochona(){ return cosas.sum({cosa => cosa.precio()}) >= 9000 }
	method compraMasCara(){ return cosas.max({cosa => cosa.precio()})}
	method electrodomesticosComprados(){ return cosas.filter({cosa => cosa.esElectrodomestico()})}
	method malaEpoca(){ return cosas.all({cosa => cosa.esComida()})}
	method queFaltaComprar(lista){return lista.asSet().difference(cosas.asSet())}
	method faltaComida(){ return cosas.filter({cosa => cosa.esComida()}).size()<2}
	
	/* Más consultas sobre la casa */
	method gastoEnComida(){return cosas.filter({cosa => cosa.esComida()}).sum({cosa => cosa.precio()})}
	method hayElectrodomesticosBaratos(){ 
		return cosas.any({cosa => cosa.esElectrodomestico() and  cosa.precio()<3000})
	}
	method preciosDeElectrodomesticos(){ 
		return self.electrodomesticosComprados().asSet().map({cosa => cosa.precio()})
	}
	method nivelEnAumento(){return cosas.last().precio()>= cosas.first().precio()*2}
	method primeraComidaComprada(){ return cosas.find({cosa => cosa.esComida()})}
	
	/* Cuanta Bancaria */
	method asignarCuenta(cuenta){cuentaBancaria=cuenta}
	method gastar(importe){cuentaBancaria.extraer(importe)}
	method dineroDisponible(){return cuentaBancaria.saldo()}
	
	/*Desafio */
	method precioPromedioComida(){
		var listaComida = cosas.filter({cosa => cosa.esComida()})
		return listaComida.sum({cosa => cosa.precio()})/listaComida.size()
	}
	method repitioCompra(){ 
		return cosas.any({cosa => cosas.occurrencesOf(cosa)>1})
	}
	method tiene(cosa){return (cosas.any({objeto=> objeto.hayUnObjeto(cosa)}))}	
	method aumentoCreciente(){
		return cosas == cosas.sortedBy({cosa1,cosa2 => cosa1.precio()< cosa2.precio()})
	}
	method comidaSalteada(){
		
	}
}