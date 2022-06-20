import wollok.game.*
import elementos.*

	
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
	var property posDeBloquesBordes = [game.at(0,0),game.at(0,1),game.at(0,2),game.at(0,3),game.at(0,4),game.at(0,5),
		game.at(0,6),game.at(0,7),game.at(0,8),game.at(0,9),game.at(0,10),game.at(0,11),game.at(0,12),game.at(0,13),
		game.at(0,14),game.at(1,0),game.at(2,0),game.at(3,0),game.at(4,0),game.at(5,0),game.at(6,0),game.at(7,0),
		game.at(8,0),game.at(9,0),game.at(10,0),game.at(11,0),game.at(12,0),game.at(13,0),game.at(14,0),game.at(15,0),
		game.at(16,0),game.at(17,0),game.at(18,0),game.at(19,0),game.at(20,0),game.at(21,0),game.at(22,0),game.at(23,0),
		game.at(24,0),game.at(24,1),game.at(24,2),game.at(24,3),game.at(24,4),game.at(24,5),game.at(24,6),game.at(24,7),
		game.at(24,8),game.at(24,9),game.at(24,10),game.at(24,11),game.at(24,12),game.at(24,13),game.at(23,14),game.at(23,15),game.at(24,14),
		game.at(22,14),game.at(21,14),game.at(20,14),game.at(19,14),game.at(18,14),game.at(17,14),game.at(16,14),game.at(15,14),
		game.at(14,14),game.at(13,14),game.at(12,14),game.at(11,14),game.at(10,14),game.at(9,14),game.at(8,14),game.at(7,14),
		game.at(6,14),game.at(5,14),game.at(4,14),game.at(3,14),game.at(2,14),game.at(1,14)]
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

	method agregarBloquesDelBorde(){
		return self.posDeBloquesBordes().forEach{p=>game.addVisual(new Bloque(position=p,image='bedrock.png'))}}
	
	method agregarBloquesDelMedio(){
		return self.posDeBloquesMedio().forEach{p=>game.addVisual(new Bloque(position=p,image='bedrock.png'))}}
	
	method agregarTodosLosBloques(){
		self.agregarBloquesDelMedio()
		self.agregarBloquesDelBorde()}
	
	method agregarLadrillos()
}
	
class Nivel1 inherits Nivel{
	var property posLadrillos = [game.at(1,3),game.at(3,3),game.at(3,5),game.at(1,5),game.at(5,3),game.at(5,7)]
	override method agregarLadrillos(){}
}


	

