import wollok.game.*
import randomizer.*
import pepita.*


object manzanaFactory {
    method crear() {
        new Manzana(position = randomizer.emptyPosition())

    }
}

object alpisteFactory {
    method crear() {
        new Alpiste(position = randomizer.emptyPosition(), peso = (40 .. 100).anyOne())

    }
}


object comidas {

    const factories = [alpisteFactory, manzanaFactory]

    const enElTablero = #{}

    method liberarEspacio(comida) {
        enElTablero.remove(comida)
    }

    method maximo() {
        return 3
    }

    method crearComida() {
        return factories.anyOne().crear()
    }

    method nuevaComida() {
        if (enElTablero.size() < self.maximo()) {
            const comida = self.crearComida()
            game.addVisual(comida)
            enElTablero.add(comida)
        }
    }

    method comenzar() {
        game.onTick(3000, "COMIDAS", {self.nuevaComida()})
    }
}



class Comida {
    const position

    method position() {
        return position
    }

    method energiaQueOtorga()

    method chocaConPepita() {
        pepita.comer(self)
        comidas.liberarEspacio(self)
        game.removeVisual(self)
    }
}


class Manzana inherits Comida {
    var property image = "manzana.png"

    const aporteBase = 5

    var madurez = 1

    override method energiaQueOtorga() {
        return aporteBase * madurez
    }

    method madurar() {
        madurez += 1
    }
}

class Alpiste inherits Comida {
    var property image = "alpiste.png"

    const peso

    override method energiaQueOtorga() {
        return peso
    }

}


/*class Manzana {
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
}*/