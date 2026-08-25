'From Cuis7.6 [latest update: #7777] on 24 August 2026 at 11:17:06 pm'!
'Description '!
!provides: '2026-2k06-G03' 1 11!
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

!Abogado methodsFor: 'as yet unclassified' stamp: 'vl 22/Aug/2026 03:29:45'!
especialidad:esp
especialidad:=esp.! !

!Abogado class methodsFor: 'as yet unclassified' stamp: 'vl 22/Aug/2026 01:51:55'!
inicializarUltimoCodigo
UltimoCodigo:=-1.! !

!Abogado class methodsFor: 'as yet unclassified' stamp: 'vl 22/Aug/2026 01:52:35'!
nuevoCodigo
UltimoCodigo:=UltimoCodigo+1.
^UltimoCodigo! !

!CobraFijo methodsFor: 'as yet unclassified' stamp: 'vl 22/Aug/2026 02:03:08'!
cargarDatos
super cargarDatos.
monto:=Prompter prompt:'Ingrese el monto que cobra el abogado'.
! !

!CobraPorcentual methodsFor: 'as yet unclassified' stamp: 'vl 22/Aug/2026 02:03:59'!
cargarDatos
super cargarDatos.
porcentaje:=Prompter prompt:'Ingrese el porcentaje que cobra el abogado'! !

!Causa methodsFor: 'as yet unclassified' stamp: 'vl 22/Aug/2026 04:07:50'!
registrarSentencia
|sent|
sent := Sentencia new.
sent cargarDatos.
sentencia:=sent.
! !

!Estudio methodsFor: 'as yet unclassified' stamp: 'vl 22/Aug/2026 01:09:06'!
buscarFueroPorCodigo: cod.
^fueros detect: [:unFuero | (unFuero codigo) = cod] ifNone:[nil]
! !

!Estudio methodsFor: 'as yet unclassified' stamp: 'vl 24/Aug/2026 20:44:58'!
inicializar
abogados:= OrderedCollection new.
causas:= OrderedCollection new.
fueros:= OrderedCollection new.
! !

!Estudio methodsFor: 'as yet unclassified' stamp: 'vl 24/Aug/2026 20:42:54'!
registrarAbogado
|valido continuar fuero opc cod tipo abogado|.
valido:=false.
continuar:=true.
tipo:=ChoicePrompter choices: #('CobraFijo' 'CobraPorcentual') caption:'Seleccione el tipo de abogado'.
(tipo='CobraFijo')
	ifTrue:[
		abogado:= CobraFijo new.
		]
	ifFalse:[
		abogado:= CobraPorcentual new.
		].
[(valido not) & (continuar)] whileTrue:[
	cod:=Prompter prompt: 'Ingrese el codigo del fuero'.
	fuero:= self buscarFueroPorCodigo: cod.
	(fuero=nil)
	ifTrue:[
		opc:= ChoicePrompter choices: #('Salir' 'Crear fuero' 'Intentar de nuevo') caption:'No existe un fuero con ese codigo. Desea crear uno, intentar con otro codigo o salir?'.
		(opc='Salir')
		ifTrue:[
			continuar:=false.
			]
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
		valido:=true
		].
	].
		
		
! !

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
