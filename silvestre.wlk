import pepita.*

object silvestre {
    var property image = "silvestre.png"

    method position() {
        return game.at(3.max(pepita.position().x()), 0)
    }
}
