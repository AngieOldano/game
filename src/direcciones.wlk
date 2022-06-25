import wollok.game.*
import bomberman.*

class Direccion{

	method position(pos)

	method puedeIr(sujeto) = self.position(sujeto.position()).objetosFrente().esAtravesable()
	
	method objetosFrente(obj){
		return game.getObjectsIn(game.at(self.position(obj.position()).x(), self.position(obj.position())).y())
	}
	
}

object arriba inherits Direccion{
	override method position(pos) = pos.up(1)}
 
object abajo inherits Direccion{
	override method position(pos) = pos.down(1)}

object derecha inherits Direccion{
	override method position(pos) = pos.right(1)} 

object izquierda  inherits Direccion{
	override method position(pos) = pos.left(1)}