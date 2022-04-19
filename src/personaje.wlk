import wollok.game.*

object mario {
	var image = "player.png"
	var position = game.center()
	
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