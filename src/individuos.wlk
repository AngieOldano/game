import wollok.game.*
import nivel.*
import bombas.*
import direcciones.*

class Individuos{

	method morir(){
		game.removeVisual(self)
	}
	
	method explotar(){
		game.removeVisual(self)
	}
	
	method chocarPared(){}

	
}


object protagonista inherits Individuos{
	var property image = "bombermanDerecha.png"
	var property position = game.at(1,1)
	var property jugadorVivo = true
	var property vidas=3
	var property direccion = null
	var property nivel = nivel1
	
	method tirarBomba(){
		const bomba = new Bomba(position=self.position().clone(),image = 'bomba.png')
		game.addVisual(bomba)
		bomba.spawn()}

	method chocarConEnemigo(enemigo){
		self.perderVida()		
	}
	
	override method chocarPared(){
		direcciones.chocar(self, direccion)
	}

	override method explotar(){
		self.perderVida()
	}
	
	method decirCantVidas(){
		game.say(self,vidas.toString())
	}
	
	method perderVida(){
		vidas = vidas - 1
		position = game.at(1, 1)
		if(vidas == 0) {
			self.morir()}
	}
	
	method chocarConIndividuo(enemigo){
		self.perderVida()
	}
}


class Enemigo inherits Individuos{
	var property position = null
	var property image='enem1.png'
	var property direccion = izquierda
	const sentidos = [ izquierda, derecha, arriba, abajo ]

	method cambiarDireccion() {
		direccion = sentidos.get(0.randomUpTo(3))
	}
	
	method direcciones(num) {
		return sentidos.get(num)
	}
	
	override method chocarPared(){
		direcciones.chocar(self, direccion)
		direccion = direccion.alChocar()
	}
	
	method moverse() {
		direcciones.move(direccion, self)
	}
	
	method chocarConIndividuo(prota){}
}
	


