import wollok.game.*


	
object musica{
	var property ost = game.sound("StageTheme.mp3")
	method play(){
		ost.shouldLoop(true)
		game.schedule(500, { ost.play()} )
	}
	method pause(){
		ost.pause()
	}
	method resume(){
		ost.resume()
	}
}


class Pared{
	var property position
	const property image 
	const property lugarLibre = false
}

