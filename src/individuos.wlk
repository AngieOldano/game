import wollok.game.*
import nivel.*
import bombas.*
import direcciones.*
import elementos.*

class Individuos{

	method morir(){
		game.removeVisual(self)
	}
	

	method chocarPared(){}

	
}


object protagonista inherits Individuos{
	var property image = "bombermanDerecha.png"
	var property position = game.at(1,1)
	var property vidas=3
	var property direccion = null
	var property nivel = 1
	
	
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

	method explotar(){
		self.perderVida()
	}
	
	method decirCantVidas(){
		game.say(self,vidas.toString())
	}
	
	method perderVida(){
		vidas = vidas - 1
		position = game.at(1, 1)
		if(vidas == 2){
			corazones.cambiarACorazones2()
		}
		else if(vidas == 1){
			corazones.cambiarACorazones1()
		}
		else{
			self.morir()
			game.stop()}
			
	}
	
	method chocarConIndividuo(enemigo){
		self.perderVida()
	}
	
	method pasarDeNivel(){
		if(nivel==1){
			nivel=2
			nivel2.configuracion()}

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
	
	method explotar(){
		game.removeVisual(self)
	}
}
	


