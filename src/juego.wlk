import wollok.game.*
import individuos.*
import direcciones.*
import musica.*
import bombas.* 
import elementos.*
import nivel.*


object juegoBomberman {

	method iniciar(){
		game.title("Bomberman")
		game.height(13)
		game.width(21)		
		game.ground('pasto.jpg')
		game.addVisualIn(pantallaDeInicio,game.at(0,0))
		pantallaDeInicio.iniciarAnimacion()
		keyboard.enter().onPressDo({nivel1.configuracion()})  
		musicaNivel.play()	

	}

}
