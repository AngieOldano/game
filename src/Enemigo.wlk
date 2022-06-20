import wollok.game.*

class Enemigos{
	var property position = self.colocar()
	var property image
	
	method colocar(){
		var posicionX = 0.randomUpTo(game.width() - 1).truncate(0)
		var posicionY = 1.randomUpTo(game.height() - 1).truncate(0)
		if(game.getObjectsIn(game.at(posicionX, posicionY)).size() >= 1){
			posicionX = 0.randomUpTo(game.width() - 1).truncate(0)
			posicionY = 1.randomUpTo(game.height() - 1).truncate(0)
		}
		return game.at(posicionX, posicionY)
		
	}
}