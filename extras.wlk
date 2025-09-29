import pepita.*

object nido {
    var property position = game.at(8,9)

    var property image = "nido.png"
}

object muro1 {
    var property position = game.at(7,9)
    var property image = "muro.png"

    method chocaConPepita() {
        pepita.volvePosicionAnterior()
    }
}

object muro2 {
    var property position = game.at(7,8)
    var property image = "muro.png"

    method chocaConPepita() {
        pepita.volvePosicionAnterior()
    }
}

object muro3 {
    var property position = game.at(7,7)
    var property image = "muro.png"

    method chocaConPepita() {
        pepita.volvePosicionAnterior()
    }
}