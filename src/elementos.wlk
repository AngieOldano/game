import wollok.game.*
import bombas.*

class Elemento{
	method sePuedeRomper()
	method desaparecer()
	method esAtravesable() = false
}


class Ladrillo inherits Elemento{
	var property position
	var property image = 'ladrillo.png'
	
	override method sePuedeRomper()=true
	override method desaparecer(){
		game.removeVisual(self)
		var exp = new Explosion(position=self.position())
		game.addVisual(exp)
		game.onTick(1000,"sacar explosion a los 1000 segundos",{exp.sacarExplosion()})
	}
}


class Bloque inherits Elemento{
	var property position
	var property image = 'bedrock.png'

	override method sePuedeRomper()=false
	override method desaparecer(){}
}


