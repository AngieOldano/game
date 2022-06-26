import wollok.game.*
import bombas.*

import individuos.*

class Elemento{
	
	
	method chocarConIndividuo(quien){
		quien.chocarPared()}
	
	method explotar(){}
}

class Ladrillo inherits Elemento{
	var property position
	var property image = 'ladrillo.png'
	

	override method explotar() {
		image = "explosion.png"
		game.onTick(500, "Explosion",{self.removerExplosion()})
	}

	method removerExplosion() {
		game.removeVisual(self)
		game.removeTickEvent("Explosion")
	}
	
}


class Bloque inherits Elemento{
	var property position
	var property image = 'piedra.jpg'


}


object paredesBorde {
	var property posDeBloquesBordes = []	

	method agregarBloquesDelBorde(){
		(game.width()).times{i=>posDeBloquesBordes.add(new Bloque(
							position=new Position(x=i-1,y=0)))
							game.addVisual(posDeBloquesBordes.last())}
		(game.width()-1).times{i=>posDeBloquesBordes.add(new Bloque(
							position=new Position(x=i,y=game.height()-1)))
							game.addVisual(posDeBloquesBordes.last())}
		(game.height()-1).times{i=>posDeBloquesBordes.add(new Bloque(
							position=new Position(x=0,y=i)))
							game.addVisual(posDeBloquesBordes.last())}
		(game.height()-1).times{i=>posDeBloquesBordes.add(new Bloque(
							position=new Position(x=game.width()-1,y=i)))
							game.addVisual(posDeBloquesBordes.last())}		
		}		
}
		
object corazones{	
	var property position = game.at(0,0)
	var property image = '3_corazones.png'
	
	method cambiarACorazones2(){
		image='2_corazones.png'
	}
	
	method cambiarACorazones1(){
		image='1_corazon.png'
	}
	method agregarCorazones(){
		game.addVisual(self)
	}
	
}



object paredesNivel1 {
	var property posDeBloquesMedio = [game.at(2,2),game.at(2,4),game.at(2,6),game.at(2,8),game.at(2,10),game.at(2,12),
									  game.at(4,2),game.at(4,4),game.at(4,6),game.at(4,8),game.at(4,10),game.at(4,12),
									  game.at(6,2),game.at(6,4),game.at(6,6),game.at(6,8),game.at(6,10),game.at(6,12),
									  game.at(8,2),game.at(8,4),game.at(8,6),game.at(8,8),game.at(8,10),game.at(8,12),
									  game.at(10,2),game.at(10,4),game.at(10,6),game.at(10,8),game.at(10,10),game.at(10,12),
									  game.at(12,2),game.at(12,4),game.at(12,6),game.at(12,8),game.at(12,10),game.at(12,12),
									  game.at(14,2),game.at(14,4),game.at(14,6),game.at(14,8),game.at(14,10),game.at(14,12),
									  game.at(16,2),game.at(16,4),game.at(16,6),game.at(16,8),game.at(16,10),game.at(16,12),
									  game.at(18,2),game.at(18,4),game.at(18,6),game.at(18,8),game.at(18,10),game.at(18,12),
									  game.at(20,2),game.at(20,4),game.at(20,6),game.at(20,8),game.at(20,10),game.at(20,12),
									  game.at(22,2),game.at(22,4),game.at(22,6),game.at(22,8),game.at(22,10),game.at(22,12)]
	var property posLadrillos = [game.at(1,3),game.at(3,1),game.at(4,1),game.at(1,5),game.at(5,3),game.at(5,7)]


	method agregarLadrillos(){
		return self.posLadrillos().forEach{p=>game.addVisual(new Ladrillo(position=p,image='ladrillo.png'))}}
		
	method agregarBloquesDelMedio(){
		return self.posDeBloquesMedio().forEach{p=>game.addVisual(new Bloque(position=p))}}
}




