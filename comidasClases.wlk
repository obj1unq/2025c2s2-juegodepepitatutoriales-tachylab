import wollok.game.*
import randomizer.*
import pepita.*


class Manzana {
    const aporteBase = 5
    var madurez = 1
    
    var property position = randomizer.position()

    var property image = "manzana.png"

    method energiaQueAporta() {
        return aporteBase * madurez
    }

    method madurar() {
        madurez += 1
    }

    method chocaConPepita() {
        pepita.comer(self)
		game.removeVisual(self)
    }
}

class Alpiste {
    var property position = randomizer.position()

    var property image = "alpiste.png"

    const peso = (40 .. 100).anyOne()

	method energiaQueOtorga() {
		return peso
	} 

    method chocaConPepita() {
        pepita.comer(self)
		game.removeVisual(self)
    }
}