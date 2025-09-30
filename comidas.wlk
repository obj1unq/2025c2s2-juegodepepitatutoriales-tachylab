import wollok.game.*
import pepita.*

object conjuntoComidas {
	const comidasTotales = #{manzana, alpiste}

	method comidasTotales() {
		return comidasTotales
	}
}


object manzana {
	const base= 5
	var madurez = 1
	var property position = game.at(2,8)

	var property image = "manzana.png"

	method energiaQueOtorga() {
		return base * madurez	
	}
	
	method madurar() {
		madurez = madurez + 1
		//madurez += 1
	}

	method chocaConPepita() {
        pepita.comer(self)
		game.removeVisual(self)
    }
}

object alpiste {
	var property position = game.at(7,5)

	var property image = "alpiste.png"

	method energiaQueOtorga() {
		return 20
	} 

    method chocaConPepita() {
        pepita.comer(self)
		game.removeVisual(self)
    }
}

