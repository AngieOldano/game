import wollok.game.*
import elementos.*


class Bomba{
	var property position
	var property image = 'bomba.png'
	var property objetosAVer = []
	var property posicionesAExplotar = []
	
	method spawn(){
		game.addVisual(self)
		game.onTick(3000,"explota en 3 segundos",{self.sacarBomba()})
	}
	method sacarBomba(){
		game.removeTickEvent("explota en 3 segundos")
		game.removeVisual(self)
		self.explotar()
	}

	method explotar(){
		const exp = new Explosion(position=self.position().clone())
		self.posicionesQuePuedenExplotar()
		game.addVisual(exp)
		self.explotarObjetos()
		game.onTick(1000,"sacar explosion a los 1000 segundos",{exp.sacarExplosion()})
	}

	method explotarObjetos(){
		self.posicionesAExplotar().forEach{p=>self.explotarObjeto(p)}
	}
	
	method explotarObjeto(posicion){
		game.getObjectsIn(posicion).forEach{objeto => objeto.desaparecer()}
	}
	
	method posicionesQuePuedenExplotar(){
		if(game.getObjectsIn(position.up(1))!=null){self.posicionesAExplotar().add(position.up(1))}
		if(game.getObjectsIn(position.down(1))!=null){self.posicionesAExplotar().add(position.down(1))}
		if(game.getObjectsIn(position.left(1))!=null){self.posicionesAExplotar().add(position.left(1))}
		if(game.getObjectsIn(position.right(1))!=null){self.posicionesAExplotar().add(position.right(1))}
		}
}
	

class Explosion{
	var property position
	var property image = 'explosion.png'
	method sacarExplosion(){
		game.removeTickEvent("sacar explosion a los 1000 segundos")
		game.removeVisual(self)
	}
}





