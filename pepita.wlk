import silvestre.*
import extras.*
import wollok.game.*
import comidas.*
import comidasClases.*

object pepita {
	var energia = 100

	var position = game.center()

	var posicionAnterior = position

	const comidasDevoradas = #{}

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
		comidasDevoradas.add(comida)
	}

	method volar(kms) {
		energia = energia - (9 * kms)
	}
	
	method energia() {
		return energia
	}

	method energia(_energia) {
		energia = _energia
	}

	//Metodos condiciones
	method loAtrapaSilvestre() {
		return game.hasVisual(silvestre) and silvestre.position() == position
	}

	method estaSinEnergia() {
		return energia < 9
	}

	method llegoAlNido() {
		return game.hasVisual(nido) and nido.position() == position
	}

	method validarSinEnergia() {
		if (self.estaSinEnergia()) {
			self.perdiste()
		}
	}

	method comisteTodaLaComida() {
		return comidasDevoradas == conjuntoComidas.comidasTotales()
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

	method terminarJuego() {
		game.removeTickEvent("gravedad")
		game.schedule(2000, {game.stop()})
	}

	method perdiste() {
		game.say(self, "¡PERDI!")
		self.terminarJuego()
	}

	method ganaste() {
		game.say(self, "¡GANE!")
		self.terminarJuego()
	}

	method ganasteElJuego() {
		if (self.comisteTodaLaComida()) {
			self.ganaste()
		}
	}

	//Metodos juegos

	method position() {
		return position
	}

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