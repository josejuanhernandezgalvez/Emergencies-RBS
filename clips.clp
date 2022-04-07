(deftemplate problem
	(slot zone (type INTEGER))
	(slot type (type SYMBOL)(allowed-symbol fire accident robbery))
	(slot people (type INTEGER)
	(slot state (type SYMBOL)(allowed-symbol Peligroso Controlado Solucionado))
	(slot danger (type SYMBOL)(allowed-symbol Minimo Medio Alto Maximo))
)

(defrule checkproblem
    (exists problem)
    (problem ?p)
    =>
        (printout t "Estado del Problema: ")
        (if (eq ?p:state Peligroso) then
        (printout t ?p:state crlf) (halt)
        (if (eq ?p:state Controlado) then
        (printout t ??p:state crlf)
        else
        ((printout t ?p:state crlf)(retract p))
)

(defrule callservice

)

(defrule setdanger

)

(defrule fire
)

(defrule accident
)

(defrule robbery
)

Como cuando ocurre un problema se crea un hecho, de esta forma podemos crear la regla de check que tenía pensada de cada cierto tiempo,
mientras el problema persista, devuelve si el problema sigue siendo peligroso, ahora está controlado o ya ha acabado (borrando el hecho una vez acabe),
cambiando nosotros el estado del hecho como quieras si con una función en python que se ejecute cada cierto tiempo o de otra manera


En la cuadrícula, podemos dejar zonas vacias, otras zonas donde solo haya un cuerpo de emergencia de esta forma tenemos reglas más complejas
ya que habrán veces que si ocurre un problema interese más ir a un cuerpo cercano antes que a el cuerpo que
debería ir --> establecemos reglas de distancia de alguna forma

Niveles de peligro -> 1(peligro mínimo), 2(peligro medio), 3(peligro alto), 4(peligro máximo)

1- Comprobar qué zona es la afectada para o mandar de esa zona o de una cercana si no hay (Esto no cambia el nivel de peligro)
2- Mirar la variable importancia. Este valor se lo asignamos nosotros manualmente y se dará según una serie de variables como
 puede ser el sitio es decir un accidente encarretera principal es más importante que uno en una de campo, o si se tiene que
 actuar con mucha rapidez...
3- Una vez tenemos las dos variables anteriores, a partir de la zona en la que está y la importancia,
mirar cuál es el problema para intentar llamar al servicio de emergencias necesario

Creo que esto debería ser la regla de determinar a qué servicio se tiene que llamar y de donde
--------------------------------

Esta es la que debería ser la regla de determinar el nivel de peligro pudiendo tener en cuenta de la regla anterior la variable importancia también
Según cada uno de los posibles problemas habrá que crear una serie de reglas diferentes ya que no se tratará igual un incendio que un accidente de coche
4- Comprobar si el peligro puede persistir en el tiempo para aumentar el nivel de importancia
5- Comprobar el número de personas afectadas en ese incidente (personas>20 es nivel 2, personas>100 nivel 3, personas>1000 nivel 4)