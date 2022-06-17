# StateObjectVSObservedObject
Ejemplo práctico para ver la diferencia entre un @ObservedObject y un @StateObject

# Explicación
Con un ObservedObject si pulsamos el boton incrementar contador, luego el boton añadir y por ultimo otra vez el de incrementar contador, se ve que el listado de videos vuelve al punto inicial. Esto es porque cada vez que se modifica el valor de "counter" la ContentView se vuelve a dibujar y se crea una nueva instancia de VideoVM, por lo que el array con el listado vuelve al punto inicial
Con StateObject se consigue evitar este problema, ya que no se crea una nueva instancia de VideVM cada vez que se redibuja la pantalla
