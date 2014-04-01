Dtrace Scripts
==============

###Comandos Básicos para el uso de dtrace

#####Listar las sondas
    # dtrace -l
#####Conteo
    # dtrace -l | wc -l
#####Listado de las sondas por funcion especifica
    # dtrace -l -f cv_wait
#####listado de sondas por un modulo especifico
    # dtrace -l -m sd
#####Listado de sondas por una funcion especifica
    # dtrace -l -n BEGIN
#####Listado de sondas por proveedro original
    # dtrace -l -P lockstat
#####Multiples Proveedores Soportando una funcion especifica o el modulo
    # dtrace -l -f read
