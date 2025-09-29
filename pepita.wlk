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

	method mover(direccion) {
		posicionAnterior = position
		position = direccion.posicionNueva(position)
		self.volarSiSeMovio()
	}

	method volarSiSeMovio() {
		if (posicionAnterior != position) {
			self.volar(1)
		}
	}

	method caer() {
		position = abajo.posicionNueva(position)
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
	method posicionNueva(posicionVieja) {
		return if (posicionVieja.y() + 1 <= game.height() - 1) {
			posicionVieja.up(1)
		}
		else {
			posicionVieja
		}
	}
}

object abajo {
	method posicionNueva(posicionVieja) {
		return if (posicionVieja.y() - 1 >= 0) {
			posicionVieja.down(1)
		}
		else {
			posicionVieja
		}
	}
}

object izquierda {
	method posicionNueva(posicionVieja) {
		return if (posicionVieja.x() - 1 >= 0) {
			posicionVieja.left(1)
		}
		else {
			posicionVieja
		}
	}
}

object derecha {
	method posicionNueva(posicionVieja) {
		return if (posicionVieja.x() + 1 <= game.width() -1) {
			posicionVieja.right(1)
		}
		else {
			posicionVieja
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