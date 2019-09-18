object cuentaCorriente{
	var saldo = 0
	method depositar(importe){ saldo += importe}
	method extraer(importe) { saldo = 0.max(saldo -importe)}
	method saldo(){return saldo}
	method saldoInicial(valor){saldo = valor}
}

object cuentaConGastos{
	var saldo
	method depositar(importe){ saldo += (importe-20)}
	method extraer(importe) {
		if (importe <=1000){saldo -= 0.max(saldo -(importe+20))}
		else {saldo -= 0.max(saldo -(importe+0.02*importe))}
	}
	method saldo(){return saldo}
	method saldoInicial(valor){saldo = valor}
	
}

object cuentaCombinada{
	var cuentaPrimaria
	var cuentaSecundaria
	method depositar(importe){ cuentaPrimaria.depositar(importe)}
	method extraer(importe) {
		if (importe <= cuentaPrimaria.saldo()){cuentaPrimaria.extraer(importe)}
		else {cuentaSecundaria.extraer(importe)}
	}
	method saldo(){return cuentaPrimaria.saldo() + cuentaSecundaria.saldo()}
	method cuentaPrimaria(cuenta){cuentaPrimaria = cuenta}
	method cuentaSecundaria(cuenta){cuentaSecundaria = cuenta}
}