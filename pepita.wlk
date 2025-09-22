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

	method image() {
		if (silvestre.position() == position) {
			return "pepita-gris.png"
		} else if (nido.position() == position) {
			return "pepita-grande.png"
		} else {
			return "pepita.png"
		}
	}
}

