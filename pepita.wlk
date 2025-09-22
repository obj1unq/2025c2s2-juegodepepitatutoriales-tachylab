import silvestre.*
import extras.*


object pepita {
	var energia = 100

	var property position = game.center()

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method volar(kms) {
		energia = energia - 10 - kms 
	}
	
	method energia() {
		return energia
	}

	//Metodos condiciones
	method loAtrapaSilvestre() {
		return silvestre.position() == position
	}

	method llegoAlNido() {
		return nido.position() == position
	}
	method image() {
		if (self.loAtrapaSilvestre()) {
			return "pepita-gris.png"
		} else if (self.llegoAlNido()) {
			return "pepita-grande.png"
		} else {
			return "pepita.png"
		}
	}
}

