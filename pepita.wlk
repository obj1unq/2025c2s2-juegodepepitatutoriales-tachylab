import silvestre.*
import extras.*
import wollok.game.*


object pepita {
	var energia = 100

	var position = game.center()

	var posicionAnterior = position

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method volar(kms) {
		energia = 0.max(energia - 9 * kms) 
	}
	
	method energia() {
		return energia
	}

	method energia(_energia) {
		energia = _energia
	}

	//Metodos condiciones
	method loAtrapaSilvestre() {
		return silvestre.position() == position
	}

	method estaSinEnergia() {
		return energia <= 0
	}

	method llegoAlNido() {
		return nido.position() == position
	}

	method position() {
		return position
	}

	method noEstaEnUnBordeEjeX() {
		//return  (0 < position.x()) and (position.x() < game.width() - 1)
		return position.x().between(1, game.width() - 2)
	}

	method noEstaEnUnBordeEjeY() {
		//return ((0 < position.y()) and (position.y() < game.height() - 1))
		return position.y().between(1, game.width() - 2)
	}

	method validarSinEnergia() {
		if (self.estaSinEnergia()) {
			game.stop()
		}
	}
	//Metodos funcionales
	method estado() {
		return if (self.llegoAlNido()) {
			ganadora.nombre()
		}
		else if (self.loAtrapaSilvestre() or self.estaSinEnergia()){
			muerta.nombre()
		}
		else {
			normal.nombre()
		}
	}

	/*method moverArriba() {
		if (self.noEstaEnUnBordeDelTablero()) {
			position = position.up(1)
			self.volar(1)
		}

	}

	method moverAbajo() {
		if (self.noEstaEnUnBordeDelTablero()) {
			position = position.down(1)
			self.volar(1)
		}
	}

	method moverDerecha() {
		if (self.noEstaEnUnBordeDelTablero()) {
			position = position.right(1)
			self.volar(1)
		}
	}

	method moverIzquierda() {
		if (self.noEstaEnUnBordeDelTablero()) {
			position = position.left(1)
			self.volar(1)
		}
	}*/

	method mover(direccion) {
		direccion.mover()
		self.volar(1)
	}

	method caer() {
		abajo.mover()
	}

	method volvePosicionAnterior() {
		position = posicionAnterior
	}
	
	//Metodos juegos
	method position(_position) {
		self.validarSinEnergia()
		posicionAnterior = position
		position = _position
	}
	
	method image() {
		return "pepita-" + self.estado() + ".png"
	}
}

//Movimientos posibles de pepita

object arriba {
	method mover() {
		if (pepita.noEstaEnUnBordeEjeY()) {
			pepita.position(pepita.position().up(1))
		}

	}

}

object abajo {
	method mover() {
		if (pepita.noEstaEnUnBordeEjeY()) {
			pepita.position(pepita.position().down(1))
		}
	}
}

object izquierda {
	method mover() {
		if (pepita.noEstaEnUnBordeEjeX()) {
			pepita.position(pepita.position().left(1))
		}
	}

}

object derecha {
	method mover() {
		if (pepita.noEstaEnUnBordeEjeX()) {
			pepita.position(pepita.position().right(1))
		}
	}
}




//Estados de pepita
object ganadora {
	method nombre() {
		return "ganadora"
	}
}

object muerta {
	method nombre() {
		return "muerta"
	}
}

object normal {
	method nombre() {
		return "normal"
	}
}