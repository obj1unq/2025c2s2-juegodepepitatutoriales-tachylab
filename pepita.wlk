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


	//Metodos juegos
	method position(_position) {
		if (not self.estaSinEnergia()) {
			position = _position
		}
	}
	
	method image() {
		return "pepita-" + self.estado() + ".png"
	}

	method text() {
		return "" + energia + ""
	}

	method textColor() {
		return "00FF00FF"
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