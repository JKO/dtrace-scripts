Dtrace Scripts
==============

Comandos Básicos para el uso de dtrace

####dtrace -l >>>>>>>>>>>>> listar las sondas
####dtrace -l | wc -l >>>>> count
####dtrace -l -f cv_wait >> listado de las sondas por funcion especifica
####dtrace -l -m sd >>>>>>> listado de sondas por un modulo especifico
####dtrace -l -n BEGIN >>>> Listado de sondas por una funcion especifica
####dtrace -l -P lockstat > Listado de sondas por proveedro original
####dtrace -l -f read >>>>> Multiples Proveedores Soportando una funcion especifica o el modulo