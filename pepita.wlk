import silvestre.*
import extras.*
import wollok.game.*


object pepita {
	var energia = 100

	var position = game.center()

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
		return energia == 0
	}

	method llegoAlNido() {
		return nido.position() == position
	}

	method position() {
		return position
	}

	method estaEnUnBordeEjeX() {
		return  (0 < position.x()) and (position.x() < game.width() - 1)
	}

	method estaEnUnBordeEjeY() {
		return ((0 < position.y()) and (position.y() < game.height() - 1))
	}

	method estaEnElTablero() {
		return self.estaEnUnBordeEjeX() and self.estaEnUnBordeEjeY()
	}

	method validarMovimiento() {
		if (not self.estaEnElTablero()) {
			self.error("Pepita está en un borde")
		}
	}


	//Metodos funcionales
	method estado() {
		return if (self.llegoAlNido()) {
			ganadora
		}
		else if (self.loAtrapaSilvestre() or self.estaSinEnergia()){
			muerta
		}
		else {
			normal
		}
	}

	method ascender() {
		self.validarMovimiento()
		position = position.up(1)
	}
	method descender() {
		self.validarMovimiento()
		position = position.down(1)
	}
	method moverDerecha() {
		self.validarMovimiento()
		position = position.right(1)
	}
	method moverIzquierda() {
		self.validarMovimiento()
		position = position.left(1)
	}

	//Metodos juegos
	method position(_position) {
		if (not self.estaSinEnergia()) {
			position = _position
		}
	}
	
	method image() {
		return "pepita-" + self.estado() + ".png"
	}
}


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