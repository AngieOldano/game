import wollok.game.*
import bombas.*

class Elemento{
	method sePuedeRomper()
	method desaparecer()
}


class Ladrillo inherits Elemento{
	var property position = game.at(1,3)
	var property image = 'ladrillo.png'
	
	override method sePuedeRomper()=true
	override method desaparecer(){
		game.removeVisual(self)
		var exp = new Explosion(position=self.position())
		game.addVisual(exp)
		game.onTick(1000,"sacar explosion a los 1000 segundos",{exp.sacarExplosion()})
	}
}