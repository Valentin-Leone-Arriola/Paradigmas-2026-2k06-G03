'From Cuis7.6 [latest update: #7777] on 1 October 2026 at 4:43:56 pm'!
'Description '!
!provides: '2026-2k06-G03' 1 18!
SystemOrganization addCategory: #'2026-2k06-G03-Clases'!


!classDefinition: #Abogado category: #'2026-2k06-G03-Clases'!
Object subclass: #Abogado
	instanceVariableNames: 'codigo nombre apellido documento tipoDocumento domicilio email telefono especialidad'
	classVariableNames: 'UltimoCodigo'
	poolDictionaries: ''
	category: '2026-2k06-G03-Clases'!
!classDefinition: 'Abogado class' category: #'2026-2k06-G03-Clases'!
Abogado class
	instanceVariableNames: ''!

!classDefinition: #CobraFijo category: #'2026-2k06-G03-Clases'!
Abogado subclass: #CobraFijo
	instanceVariableNames: 'monto'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2026-2k06-G03-Clases'!
!classDefinition: 'CobraFijo class' category: #'2026-2k06-G03-Clases'!
CobraFijo class
	instanceVariableNames: ''!

!classDefinition: #CobraPorcentual category: #'2026-2k06-G03-Clases'!
Abogado subclass: #CobraPorcentual
	instanceVariableNames: 'porcentaje'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2026-2k06-G03-Clases'!
!classDefinition: 'CobraPorcentual class' category: #'2026-2k06-G03-Clases'!
CobraPorcentual class
	instanceVariableNames: ''!

!classDefinition: #Causa category: #'2026-2k06-G03-Clases'!
Object subclass: #Causa
	instanceVariableNames: 'numeroExpediente fechaInicio juzgado fuero demandante demandado abogadoAsignado detalle sentencia'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2026-2k06-G03-Clases'!
!classDefinition: 'Causa class' category: #'2026-2k06-G03-Clases'!
Causa class
	instanceVariableNames: ''!

!classDefinition: #Estudio category: #'2026-2k06-G03-Clases'!
Object subclass: #Estudio
	instanceVariableNames: 'abogados causas fueros'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2026-2k06-G03-Clases'!
!classDefinition: 'Estudio class' category: #'2026-2k06-G03-Clases'!
Estudio class
	instanceVariableNames: ''!

!classDefinition: #Fuero category: #'2026-2k06-G03-Clases'!
Object subclass: #Fuero
	instanceVariableNames: 'codigo descripcion'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2026-2k06-G03-Clases'!
!classDefinition: 'Fuero class' category: #'2026-2k06-G03-Clases'!
Fuero class
	instanceVariableNames: ''!

!classDefinition: #Sentencia category: #'2026-2k06-G03-Clases'!
Object subclass: #Sentencia
	instanceVariableNames: 'fecha resultado monto'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2026-2k06-G03-Clases'!
!classDefinition: 'Sentencia class' category: #'2026-2k06-G03-Clases'!
Sentencia class
	instanceVariableNames: ''!


!Abogado methodsFor: 'as yet unclassified' stamp: 'dlka 29/Aug/2026 17:26:00'!
apellido
^apellido! !

!Abogado methodsFor: 'as yet unclassified' stamp: 'dlka 29/Aug/2026 17:54:32'!
calcularHaberCausa: unaCausa
self subclassResponsibility! !

!Abogado methodsFor: 'as yet unclassified' stamp: 'vl 24/Aug/2026 20:41:23'!
cargarDatos
nombre:=Prompter prompt:'Ingrese el nombre'.
apellido:=Prompter prompt:'Ingrese el apellido'.
tipoDocumento:=ChoicePrompter choices: #('DNI' 'Pasaporte').
domicilio:=Prompter prompt: 'Ingrese el domicilio del abogado'.
email:=Prompter prompt: 'Ingrese el email del abogado'.
telefono:=(Prompter prompt: 'Ingrese el telefono del abogado') asNumber.
codigo:=Abogado nuevoCodigo.


! !

!Abogado methodsFor: 'as yet unclassified' stamp: 'vl 29/Aug/2026 00:53:56'!
especialidad
^especialidad! !

!Abogado methodsFor: 'as yet unclassified' stamp: 'vl 22/Aug/2026 03:29:45'!
especialidad:esp
especialidad:=esp.! !

!Abogado methodsFor: 'as yet unclassified' stamp: 'dlka 29/Aug/2026 17:25:52'!
nombre
^nombre! !

!Abogado class methodsFor: 'as yet unclassified' stamp: 'vl 22/Aug/2026 01:51:55'!
inicializarUltimoCodigo
UltimoCodigo:=-1.! !

!Abogado class methodsFor: 'as yet unclassified' stamp: 'vl 22/Aug/2026 01:52:35'!
nuevoCodigo
UltimoCodigo:=UltimoCodigo+1.
^UltimoCodigo! !

!CobraFijo methodsFor: 'as yet unclassified' stamp: 'dlka 29/Aug/2026 17:26:30'!
calcularHaberCausa: causa.
^monto! !

!CobraFijo methodsFor: 'as yet unclassified' stamp: 'vl 22/Aug/2026 02:03:08'!
cargarDatos
super cargarDatos.
monto:=Prompter prompt:'Ingrese el monto que cobra el abogado'.
! !

!CobraPorcentual methodsFor: 'as yet unclassified' stamp: 'dlka 29/Aug/2026 17:30:38'!
calcularHaberCausa: unaCausa
|montoCausa|
montoCausa:= (unaCausa sentencia) monto.
^(montoCausa * ((porcentaje)/100)) asNumber.! !

!CobraPorcentual methodsFor: 'as yet unclassified' stamp: 'vl 22/Aug/2026 02:03:59'!
cargarDatos
super cargarDatos.
porcentaje:=Prompter prompt:'Ingrese el porcentaje que cobra el abogado'! !

!Causa methodsFor: 'as yet unclassified' stamp: 'vl 29/Aug/2026 01:21:37'!
abogadoAsignado
^abogadoAsignado! !

!Causa methodsFor: 'as yet unclassified' stamp: 'vl 29/Aug/2026 01:33:24'!
abogadoAsignado: abogado
abogadoAsignado:=abogado.! !

!Causa methodsFor: 'as yet unclassified' stamp: 'dlka 29/Aug/2026 14:59:26'!
cargarDatos
fechaInicio:= Date fromString: (Prompter prompt:'Ingrese una fecha con formato dd/mm/aaaa').
juzgado:=Prompter prompt:'Ingrese el juzgado de la causa'.
demandante:=Prompter prompt:'Ingrese el nombre y apellido del demandante'.
demandado:=Prompter prompt:'Ingrese el nombre y apellido del demandado'.
detalle:=Prompter prompt:'Ingrese el motivo de la demanda'.! !

!Causa methodsFor: 'as yet unclassified' stamp: 'dlka 29/Aug/2026 16:56:05'!
fechaInicio
^fechaInicio! !

!Causa methodsFor: 'as yet unclassified' stamp: 'vl 28/Aug/2026 23:53:20'!
fuero
^fuero! !

!Causa methodsFor: 'as yet unclassified' stamp: 'vl 29/Aug/2026 00:19:22'!
fuero: unFuero.
fuero:=unFuero.! !

!Causa methodsFor: 'as yet unclassified' stamp: 'dlka 29/Aug/2026 14:48:33'!
generaHaberes
|resul|.
(sentencia = nil)
ifTrue:[
	^false
	]
ifFalse:[
	resul:= sentencia resultado.
	(resul = 'Favorable')
	ifTrue:[
		^true
		]
	ifFalse:[
		^false
	].
].
! !

!Causa methodsFor: 'as yet unclassified' stamp: 'vl 28/Aug/2026 22:26:57'!
numeroExpediente
^numeroExpediente! !

!Causa methodsFor: 'as yet unclassified' stamp: 'vl 28/Aug/2026 23:29:43'!
numeroExpediente: num
numeroExpediente:= num.! !

!Causa methodsFor: 'as yet unclassified' stamp: 'vl 22/Aug/2026 04:07:50'!
registrarSentencia
|sent|
sent := Sentencia new.
sent cargarDatos.
sentencia:=sent.
! !

!Causa methodsFor: 'as yet unclassified' stamp: 'vl 29/Aug/2026 01:20:49'!
sentencia
^sentencia! !

!Estudio methodsFor: 'as yet unclassified' stamp: 'u 29/Sep/2026 01:07:56'!
abogados
^abogados
! !

!Estudio methodsFor: 'as yet unclassified' stamp: 'dlka 29/Aug/2026 16:20:25'!
asignarAbogado: causa
|cont abogadoMin cantCausasMin abogadoCausa sentenciaCausa|
cantCausasMin:= causas size.
abogadoMin:=nil.
abogados do:[:unAbogado|
	(unAbogado especialidad = causa fuero)
		ifTrue:[
			cont:=0.
			causas do:[:unaCausa|
				sentenciaCausa:= unaCausa sentencia.
				abogadoCausa:= unaCausa abogadoAsignado.
				((unaCausa abogadoAsignado = unAbogado) & (sentenciaCausa = nil))
				ifTrue:[
					cont:=cont+1.
					].
				].
			(cont<=cantCausasMin)
			ifTrue:[
				abogadoMin:=unAbogado.
				cantCausasMin:=cont.
				].
			]	
].
(abogadoMin = nil)
ifTrue:[
	MessageBox notify:'No existen abogados pertenecientes al fuero de la causa'.
	^nil
	]
ifFalse:[
	causa abogadoAsignado: abogadoMin.
	].
! !

!Estudio methodsFor: 'as yet unclassified' stamp: 'vl 28/Aug/2026 22:39:48'!
buscarAbogadoPorCodigo: cod.
^abogados detect: [:unAbogado | (unAbogado codigo) = cod] ifNone:[nil]! !

!Estudio methodsFor: 'as yet unclassified' stamp: 'vl 28/Aug/2026 22:30:01'!
buscarCausaPorNumero: numero.
^causas detect: [:unaCausa | (unaCausa numeroExpediente) = numero] ifNone:[nil]! !

!Estudio methodsFor: 'as yet unclassified' stamp: 'vl 22/Aug/2026 01:09:06'!
buscarFueroPorCodigo: cod.
^fueros detect: [:unFuero | (unFuero codigo) = cod] ifNone:[nil]
! !

!Estudio methodsFor: 'as yet unclassified' stamp: 'u 29/Sep/2026 01:15:41'!
causas
^causas
! !

!Estudio methodsFor: 'as yet unclassified' stamp: 'u 29/Sep/2026 02:03:32'!
cerrarCausa
| nro causaEncontrada|

nro := (Prompter prompt: 'Ingrese el número de la causa a cerrar:') asNumber.
causaEncontrada := causas
    detect: [ :cadaCausa | cadaCausa numeroExpediente = nro ]
    ifNone: [ nil ].
causaEncontrada isNil
    ifTrue: [ self inform:' Error: La causa ingresada no existe. ']
    ifFalse: [ causaEncontrada registrarSentencia.
	            self inform:' Causa cerrada y sentencia registrada con exito.'.
	].! !

!Estudio methodsFor: 'as yet unclassified' stamp: 'u 29/Sep/2026 01:15:24'!
fueros
^fueros
! !

!Estudio methodsFor: 'as yet unclassified' stamp: 'vl 24/Aug/2026 20:44:58'!
inicializar
abogados:= OrderedCollection new.
causas:= OrderedCollection new.
fueros:= OrderedCollection new.
! !

!Estudio methodsFor: 'as yet unclassified' stamp: 'dlka 29/Aug/2026 18:22:27'!
liquidarHaberes
|fechaDesde fechaHasta generaHab difFechaDesde difFechaHasta fechaCierre montoLiquidar abogado|
fechaDesde:= Date fromString: (Prompter prompt:'Ingrese la fecha de inicio del periodo a liquidar con formato dd/mm/aaaa').
fechaHasta:= Date fromString: (Prompter prompt:'Ingrese la fecha de fin del periodo a liquidar con formato dd/mm/aaaa').
causas do:[:unaCausa |
	generaHab:=unaCausa generaHaberes.
	(generaHab)
	ifTrue:[
		fechaCierre:= (unaCausa sentencia) fecha.
		difFechaDesde:= (fechaCierre subtractDate: fechaDesde) asNumber.
		difFechaHasta:=(fechaCierre subtractDate: fechaHasta) asNumber.
		((difFechaDesde>=0) & (difFechaHasta<=0))
		ifTrue:[
			abogado:= unaCausa abogadoAsignado. 
			montoLiquidar:= abogado calcularHaberCausa: unaCausa. 
			Transcript 
			show: (unaCausa numeroExpediente)asString , ' | ';
			show: (unaCausa fechaInicio) asString , ' | ';
			show: fechaCierre asString, ' | ';
			show: unaCausa fuero , ' | ';
			show: abogado nombre , ' | ';
			show: abogado apellido , ' | ';
			show: ((unaCausa sentencia) monto ) asString, ' | ';
			show: montoLiquidar asString;
			cr.
			].
		].
	].

	
	! !

!Estudio methodsFor: 'as yet unclassified' stamp: 'u 1/Oct/2026 16:43:24'!
menu
| opc mensajeopc  opcvalida|
self inicializar.
opc := 0.
mensajeopc := '
 ESTUDIO JURÍDICO
1. Registrar Abogado
2. Registrar Causa
3. Registrar Fuero
4. Liquidar Haberes
5. Cerrar Causa
6. Salir'.

[opc = 6] whileFalse: [
	opcvalida:= false.
	opc:=( Prompter prompt: mensajeopc) asNumber.
	((opc >= 1) and: [opc <=6])
	ifTrue:[ opcvalida := true]
	ifFalse:[ self inform:' Error: Ingrese un numero entre en 1 y 6.'].
       (opcvalida = true) ifTrue:[
	    (opc = 1) ifTrue:[ 
		
		fueros isEmpty
		    ifTrue:[ self inform: 'Error: No se pueden registrar abogados si no hay fueros cargados.']
		    ifFalse:[ self registrarAbogado ].
		].
	    (opc = 2) ifTrue:[
		
		 abogados isEmpty              
		     ifTrue:[ self inform: 'Error: No se pueden registrar causas si no hay abogados cargados.' ]
		     ifFalse:[ self registrarCausa].
		 ].
	
	    (opc = 3) ifTrue:[ self registrarFuero ].
	
	    (opc = 4) ifTrue:[ 
		causas isEmpty
		ifTrue: [ self inform: ' Error: No se pueden liquidar haberes si no hay causas cargadas. ']
		ifFalse: [ self liquidarHaberes ].
		].
	
	    (opc = 5) ifTrue:[ 
		causas isEmpty
		ifTrue: [ self inform:' Error: NO se pueden cerrar causas si no hay causas registradas. ']
		ifFalse: [ self cerrarCausa ].
		 ].
	    
	].
].
			


! !

!Estudio methodsFor: 'as yet unclassified' stamp: 'vl 28/Aug/2026 22:56:08'!
registrarAbogado
|valido fuero opc cod tipo abogado|.
valido:=false.
opc:='Continuar'.
tipo:=ChoicePrompter choices: #('CobraFijo' 'CobraPorcentual') caption:'Seleccione el tipo de abogado'.
(tipo='CobraFijo')
	ifTrue:[
		abogado:= CobraFijo new.
		]
	ifFalse:[
		abogado:= CobraPorcentual new.
		].
[(valido not) & (opc~='Salir')] whileTrue:[
	cod:=Prompter prompt: 'Ingrese el codigo del fuero'.
	fuero:= self buscarFueroPorCodigo: cod.
	(fuero=nil)
	ifTrue:[
		opc:= ChoicePrompter choices: #('Salir' 'Crear fuero' 'Intentar de nuevo') caption:'No existe un fuero con ese codigo. Desea crear uno, intentar con otro codigo o salir?'.
		(opc='Salir')
		ifFalse:[
			(opc='Crear fuero')
			ifTrue:[
				self registrarFuero.
				].
			].
		]
	ifFalse:[
		abogado especialidad: fuero.
		abogado cargarDatos.
		abogados add: abogado.
		valido:=true.
		].
	].
		
		
! !

!Estudio methodsFor: 'as yet unclassified' stamp: 'vl] 28/Sep/2026 16:57:32'!
registrarCausa
|numExpediente codFuero fueroIngresado continuar valido causa causaAsignada|.
continuar:=true.
valido:=false.
[continuar & (valido not)] whileTrue:[
	numExpediente:= (Prompter prompt:'Ingrese el numero de expediente de la causa') asNumber.
	valido:=self buscarCausaPorNumero: numExpediente.
	(valido = nil)
	ifTrue:[
		valido:=true.
		causa:= Causa new.
		causa numeroExpediente: numExpediente. 
		]
	ifFalse:[
		continuar:= MessageBox confirm:'Ya existe una causa con este numero de expediente. Desea intentarlo nuevamente?'.
		valido:=false
		].
].
valido:=false.
[continuar & (valido not)] whileTrue:[
	codFuero:=Prompter prompt: 'Ingrese el codigo del fuero de la causa'.
	fueroIngresado:= self buscarFueroPorCodigo: codFuero.
	(fueroIngresado = nil)
	ifTrue:[
		continuar:= MessageBox confirm:'No existe un fuero con este codigo. Desea intentarlo nuevamente?'.
		]
	ifFalse:[
		causa fuero: fueroIngresado.
		valido:=true.
		].
	].
causaAsignada:=self asignarAbogado: causa.
(causaAsignada = nil)
ifFalse:[
	causaAsignada cargarDatos.
	causas add: causaAsignada. 
	].! !

!Estudio methodsFor: 'as yet unclassified' stamp: 'vl 22/Aug/2026 02:28:26'!
registrarFuero
|fuero cod valido continuar|.
valido:=false.
continuar:=true.
[(valido not) & (continuar)] whileTrue:[
	cod:= Prompter prompt: 'Ingrese el codigo'.
	fuero:= self buscarFueroPorCodigo: cod.
	(fuero=nil)
		ifTrue:[
			valido:=true.
			fuero:= Fuero new.
			fuero codigo:cod.
			fuero descripcion: (Prompter prompt:'Ingrese una descripcion').
			fueros add: fuero.
			]
		ifFalse:[
			continuar:= MessageBox confirm:'Ya existe un fuero con este codigo. Desea intentarlo nuevamente?'.
			]
].
			


! !

!Fuero methodsFor: 'as yet unclassified' stamp: 'vl 22/Aug/2026 00:20:23'!
codigo
^codigo! !

!Fuero methodsFor: 'as yet unclassified' stamp: 'vl 22/Aug/2026 00:20:09'!
codigo: cod
codigo:=cod.! !

!Fuero methodsFor: 'as yet unclassified' stamp: 'vl 22/Aug/2026 00:21:39'!
descripcion
^descripcion! !

!Fuero methodsFor: 'as yet unclassified' stamp: 'vl 22/Aug/2026 00:21:24'!
descripcion: desc
descripcion:=desc.! !

!Sentencia methodsFor: 'as yet unclassified' stamp: 'vl 24/Aug/2026 20:48:52'!
cargarDatos
fecha:= Date fromString: (Prompter prompt:'Ingrese una fecha con formato dd/mm/aaaa').
resultado:= ChoicePrompter choices: #('Favorable' 'No favorable').
(resultado='Favorable')
	ifTrue:[
		monto:=(Prompter prompt:'Ingrese el monto obtenido') asNumber.
		]
	ifFalse:[
		monto:=0.
		].
	

! !

!Sentencia methodsFor: 'as yet unclassified' stamp: 'dlka 29/Aug/2026 16:56:17'!
fecha
^fecha! !

!Sentencia methodsFor: 'as yet unclassified' stamp: 'dlka 29/Aug/2026 17:29:52'!
monto
^monto! !

!Sentencia methodsFor: 'as yet unclassified' stamp: 'vl 28/Aug/2026 20:22:42'!
resultado
^resultado! !
