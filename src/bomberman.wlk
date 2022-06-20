import wollok.game.*
import nivel.*
import bombas.*

object protagonista{
	var property image = "bombermanDerecha.png"
	var property position = game.at(1,1)
	var property jugadorVivo = true

 		
	method subir(){self.moverse(position.up(1))}
	method bajar(){self.moverse(position.down(1))}
	method izquierda(){
		self.moverse(position.left(1))
		self.image('bombermanIzquierda.png')
	}
	method derecha(){
		self.moverse(position.right(1))
		self.image('bombermanDerecha.png')
	}

	
	method moverse(pos){

			self.position(pos)
	}
	
	
	method tirarBomba(){
		const bomba = new Bomba(position=self.position().clone(),image = 'bomba.png')
		game.addVisual(bomba)
	}


}

class Bomba{
	//var property position
	//var image = 'bomba.png'
	//var estado = prendida
	
	//method explotar()=
	//method imagenExplocion() = 'exlosion.png'
	
}



