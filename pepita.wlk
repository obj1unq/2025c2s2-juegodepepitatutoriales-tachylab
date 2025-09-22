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

	method position(_position) {
		if (not self.estaSinEnergia()) {
			position = _position
		}
	}
	
	method image() {
		if (self.loAtrapaSilvestre() or self.estaSinEnergia()) {
			return "pepita-gris.png"
		} else if (self.llegoAlNido()) {
			return "pepita-grande.png"
		} else {
			return "pepita.png"
		}
	}

	method text() {
		return "" + energia + ""
	}

	method textColor() {
		return "00FF00FF"
	}
}

