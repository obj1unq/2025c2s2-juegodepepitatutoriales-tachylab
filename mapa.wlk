import extras.*
import pepita.*

object m {
    method dibujar(newPosition) {
        game.addVisual(new Muro(position = newPosition))
    }
}

object _ {
    method dibujar(newPosition) {}
}

object p {
    method dibujar(newPosition) {
        pepita.position(newPosition)
    }
}

object n {
    method dibujar(newPosition) {
        nido.position(newPosition)
        game.addVisual(nido)
    }
}


object mapa {

    const dibujo = [
    [_, _, _, m, _, _, _, _, _, _],
    [_, _, _, m, _, _, _, _, n, _],
    [_, _, _, m, _, _, _, _, _, _],
    [_, _, _, m, _, _, _, _, _, _],
    [_, _, _, m, _, _, _, _, _, _],
    [_, _, _, m, m, m, m, _, _, _],
    [p, _, _, _, _, _, _, _, _, _],
    [_, _, _, _, _, _, _, _, _, _],
    [_, _, _, _, _, _, _, _, _, _],
    [_, _, _, _, _, _, _, _, _, _]
    ].reverse() //Dibujo del mapa entero como una matriz, modelado como una lista de listas

    method construir() {

        game.height(dibujo.size()) //La altura del juego viene determinada por la cantidad de listas dentro de la lista dibujo
        game.width(dibujo.anyOne().size()) //El ancho del juego viene determinado por la cantidad de elementos de cada lista, asumiendo que todas las listas tienen el mismo size

        (0 .. game.width() - 1).forEach({ x =>
            (0 .. game.height() - 1).forEach({ y =>
                dibujo.get(y).get(x).dibujar(game.at(x, y))
                }
                )
            }
            )
                //chusmear esto en el código de Leo
    }

    /* 

   [_, _, _, M, _, _, _, _, _, _],
   [_, _, _, M, _, _, _, _, _, _],
   [_, _, _, M, _, _, _, _, _, _],
   [_, _, _, M, _, _, _, _, _, _],
   [_, _, _, M, _, _, _, _, _, _],
   [_, _, _, M, M, M, M, _, _, _],
   [_, _, _, _, _, _, _, _, _, _],
   [_, _, _, _, _, _, _, _, _, _],
   [_, _, _, _, _, _, _, _, _, _],
   [_, _, _, _, _, _, _, _, _, _],

*/

}

class Muro {
    const property position

    method image() {
        return "muro.png"
    }

    method chocaConPepita() {
        pepita.volvePosicionAnterior()
    }
}





