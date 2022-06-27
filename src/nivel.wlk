import wollok.game.*
import elementos.*
import direcciones.*
import individuos.*

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
object juego {
	var juegoIniciado = false
	method iniciar(){
		game.title("Bomberman!")
		game.height(13)
		game.width(21)
		game.boardGround("pasto.jpg")
		game.addVisualIn(pantallaDeInicio,game.at(0,0))
		pantallaDeInicio.iniciarAnimacion()
		keyboard.enter().onPressDo({nivel1.configuracion()})  
		musica.play()	
		game.start()
	}
}

object pantallaDeInicio{
	var imagen = false
	method iniciarAnimacion(){
		game.onTick(250,"Animacion del menu",{self.cambiar()})
	}
	method terminarAnimacion(){
		game.removeTickEvent("Animacion del menu")
	}
	method cambiar(){
		if(imagen)
			imagen = false
		else
			imagen = true
	}
	method image() {
		if(imagen)
			return "bombermanInicioEnter.png"
		else
			return "bombermanInicio.png"
	}
}

class Nivel{

	method keyboard(){
	keyboard.space().onPressDo {protagonista.tirarBomba()}
	keyboard.z().onPressDo {protagonista.decirCantVidas()}
	}
	
	method configuracion() {
		game.clear()
		direcciones.movBomberman(protagonista)
		paredesBorde.agregarBloquesDelBorde()
		corazones.agregarCorazones()
		paredesNivel1.agregarBloquesDelMedio()
		paredesNivel1.agregarLadrillos()
		paredesNivel1.agregarPuertaASiguienteNivel()

	//	paredesNivel1.agregarLadrillos()
		

		self.individuos()
		self.keyboard()
	}
	
	method individuos(){}
	
}


object nivel1 inherits Nivel {
	var ene1 = new Enemigo()
	var ene2 = new Enemigo()
	var ene3 = new Enemigo()
	var ene4 = new Enemigo()
	var ene5 = new Enemigo()
	
	override method configuracion() {
		super()
		game.whenCollideDo(protagonista,{elemento=>elemento.chocarConIndividuo(protagonista)})
		game.whenCollideDo(ene1,{elemento=>elemento.chocarConIndividuo(ene1)})
		game.whenCollideDo(ene2,{elemento=>elemento.chocarConIndividuo(ene2)})
		game.whenCollideDo(ene3,{elemento=>elemento.chocarConIndividuo(ene3)})
		game.whenCollideDo(ene4,{elemento=>elemento.chocarConIndividuo(ene4)})
		game.whenCollideDo(ene5,{elemento=>elemento.chocarConIndividuo(ene5)})
		game.whenCollideDo(protagonista,{enemigo => protagonista.chocarConIndividuo(enemigo) })
		game.onTick(600,"mover enemigo",{ene1.moverse()})	
		game.onTick(600,"mover enemigo",{ene2.moverse()})	
		game.onTick(600,"mover enemigo",{ene3.moverse()})	
		game.onTick(600,"mover enemigo",{ene4.moverse()})	
		game.onTick(600,"mover enemigo",{ene5.moverse()})	
		}

	override method individuos(){
		protagonista.position(game.at(1,1))
		game.addVisual(protagonista)
		game.addVisual(ene1)
		ene1.position(game.at(6, 3))
		game.addVisual(ene2)
		ene2.position(game.at(9, 5))
		game.addVisual(ene3)
		ene3.position(game.at(10, 7))
		game.addVisual(ene4)
		ene4.position(game.at(2, 9))
		game.addVisual(ene5)
		ene5.position(game.at(16, 9))
	}
}





