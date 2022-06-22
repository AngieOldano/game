import wollok.game.*
import elementos.*
import Enemigo.*
	
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


class Nivel{
	var property posDeBloquesBordes = []
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
									  game.at(22,2),game.at(22,4),game.at(22,6),game.at(22,8),game.at(22,10),game.at(22,12),
									  ]
	var enemigos=[]
	
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

		

	method agregarBloquesDelMedio(){
		return self.posDeBloquesMedio().forEach{p=>game.addVisual(new Bloque(position=p,image='bedrock.png'))}}
	
	method agregarTodosLosBloques(){
		self.agregarBloquesDelMedio()
		self.agregarBloquesDelBorde()}
	
	method colocarEnemigos(){
		(0..5).forEach{idx=>enemigos.add(new Enemigo(
					image='enem1.png',
					position=new Position(x = 5.randomUpTo(game.width()-1).truncate(0),
										 y= 5.randomUpTo(game.height()-1).truncate(0))))
										 game.addVisual(enemigos.last())}
										 game.onTick(800,'colocar enemigos',{self.moverEnemigos()})}
		
					
	method moverEnemigos(){
		enemigos.forEach{e=>e.mover()}
	}									 
	method agregarLadrillos()
	method agregarTodosElementos()

}
	
class Nivel1 inherits Nivel{
	var property posLadrillos = [game.at(1,3),game.at(3,1),game.at(4,1),game.at(1,5),game.at(5,3),game.at(5,7),game.at(5,7),game.at(5,7),
								 game.at(1,3),game.at(3,3),game.at(3,5),game.at(1,5),game.at(5,3),game.at(5,7),game.at(5,7),game.at(5,7),
								 game.at(1,3),game.at(3,3),game.at(3,5),game.at(1,5),game.at(5,3),game.at(5,7),game.at(5,7),game.at(5,7)]
	
	override method agregarLadrillos(){
		return self.posLadrillos().forEach{p=>game.addVisual(new Ladrillo(position=p,image='ladrillo.png'))}}
	
	override method agregarTodosElementos(){
		self.agregarTodosLosBloques()
		self.agregarLadrillos()
		self.colocarEnemigos()}
}

}