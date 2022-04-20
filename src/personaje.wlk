import wollok.game.*

object mario {
	var energia = 0.randomUpTo(11).truncate(0)
	var image = "player.png"
	var position = game.at(
		0.randomUpTo(game.width().truncate(0)),
		0.randomUpTo(game.height().truncate(0)))
		
	
	method energia() = energia
	
	method descontarEnergia(unValor){
		energia = unValor
	}
	
	method estasVivo() = energia>0
	
	method position(unaPosicion){position = unaPosicion} // SETTER (INDICACION)
	method position() = position  // GETTER (CONSULTA)

	method image(unaImagen){image = unaImagen} //SETTER (INDICAION)
	method image() = image //GETTER (CONSULTA)
	
	
}

object tomaco {
	var image = "tomaco.png"
	var position = 
	
	method position(unaPosicion){position = unaPosicion} // SETTER (INDICACION)
	method position() = position  // GETTER (CONSULTA)

	method image(unaImagen){image = unaImagen} //SETTER (INDICAION)
	method image() = image //GETTER (CONSULTA)
	
	
}