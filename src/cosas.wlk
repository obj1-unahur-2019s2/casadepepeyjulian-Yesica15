object heladera {
	method precio() { return 20000 }
	method esComida() { return false }
	method esElectrodomestico() { return true }	
}

object cama {
	method precio() { return 8000 }
	method esComida() { return false }
	method esElectrodomestico() { return false }	
}

object tiraDeAsado {
	method precio() { return 350 }
	method esComida() { return true }
	method esElectrodomestico() { return false }	
}

object paqueteDeFideos {
	method precio() { return 50 }
	method esComida() { return true }
	method esElectrodomestico() { return false }	
}

object plancha {
	method precio() { return 1200 }
	method esComida() { return false }
	method esElectrodomestico() { return true }	
}

object milanesaRebozadaKilo {
	var property precio = 260
	method esComida() { return true }
	method esElectrodomestico() { return false }	
}

object botellaSalsaTomate {
	method precio() { return 90 }
	method esComida() { return true }
	method esElectrodomestico() { return false }	
}

object microondas {
	method precio() { return 4200 }
	method esComida() { return false }
	method esElectrodomestico() { return true }	
}

object cebollaKilo {
	method precio() { return 25 }
	method esComida() { return true }
	method esElectrodomestico() { return false }	
}

object compu {
	method precio() { return 500*dolar.cotizacion() }
	method esComida() { return false }
	method esElectrodomestico() { return true }	
}

object dolar{
	var property cotizacion = 58
}

object packComida {
	var property platoPrincipal = null
	var property aderezo = null
	method precio() { return platoPrincipal.precio() + aderezo.precio() }
	method esComida() { return true }
	method esElectrodomestico() { return false }	
}

object packRegalo {
	var cosas = []
	method  agregarPack(listaCompra){cosas = listaCompra}
	method precio() { return cosas.sum({cosa => cosa.precio()})*0.8 }
	method esComida() { return cosas.all({cosa => cosa.esComida()})}
	method esElectrodomestico() { return cosas.any({cosa => cosa.esElectrodomestico()}) }	
}
