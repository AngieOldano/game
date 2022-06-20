import wollok.game.*
import nivel.*


object protagonista{
	var property position = game.at(1,1)
	var property image = "bombermanDerecha.png"
	var vidas = 3
	var property direccion
	//var mirandoA = izquierda


	method subir(){self.mover(position.up(1))}
	method bajar(){self.mover(position.down(1))}
	method izquierda(){self.mover(position.left(1))}
	method derecha(){self.mover(position.right(1))}
	method mover(pos){
		position=pos
	}
	method tirarBomba(){
		self.plantarBomba(new Bomba())
	}
	
	method plantarBomba(bomba){
		position.clone().drawElement(bomba)
	}

}

class Bomba{
	//var property position
	//var image = 'bomba.png'
	//var estado = prendida
	
	//method explotar()=
	//method imagenExplocion() = 'exlosion.png'
	
}



