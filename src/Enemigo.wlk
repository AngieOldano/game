import wollok.game.*
import elementos.*
import direcciones.*

class Enemigo{
	var property position
	var property image='enem1.png'
//https://www.youtube.com/watch?v=dc0ZwpgJnss&t=3085s
	method direcPosibles(){
		const direcciones = [arriba,abajo,derecha,izquierda]
		if (position.y() == game.height()-1){direcciones.remove(arriba)} 
		if (position.y() == 0){direcciones.remove(abajo)} 
		if (position.x() == game.width()-1){direcciones.remove(derecha)}
		if (position.x() == 0){direcciones.remove(izquierda)}
		return direcciones
	}
	
//	method mover(){
//		self.position(self.direcPosibles().anyOne().mover(position))}
	
	
	method mover(){
		self.moverse(self.direcPosibles().anyOne())}


	method moverse(dir) {
		self.moverseSiPuede(dir)
	}

	method moverseSiPuede(dir){
		if (dir.puedeIr(dir)) {
			self.moverHacia(dir)
		}
	}

	method puedeMoverse(pos) = pos.allElements().all{ o => o.esAtravesable()}

	method moverHacia(dir) {
		if (self.puedeMoverse(self.direcPosibles().anyOne())){
			self.position(self.direcPosibles().anyOne())
		}
	}


}
//object arriba{
//	method mover(pos){
//		return pos.up(1)}	
//}
//object abajo{
//	method mover(pos){
//		return pos.down(1)}	
//}
//object derecha{
//	method mover(pos){
//		return pos.right(1)}	
//}
//object izquierda{
//	method mover(pos){
//		return pos.left(1)}	
//}
