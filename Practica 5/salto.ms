sphere radius:5 pos:[2,46,0] wireColor:blue
box length:8 width:8 height:8 pos:[-45,45,0] wireColor:red
box length:8 width:8 height:8 pos:[30,-30,0] wireColor:red
box length:8 width:8 height:8 pos:[33,45,0] wireColor:green
Teapot radius:5 pos:[-53.6547,-40.7193,0]

fn interpolacionLineal Traveler t p1 p2 =(
	V = p2-p1
	return p1 + ((normalize V) * (((length V)/100)*t))
)

fn interpolacionCuadratica Traveler t p1 p2 p3 =(
	V1 = interpolacionLineal Traveler t p1 p2
	V2 = interpolacionLineal Traveler t p2 p3
	return (interpolacionLineal Traveler t V1 V2)
)


fn puntoMedio pos1 pos2 =(
	X = (pos1.x + pos2.x)/2
	Y = (pos1.y + pos2.y)/2

	return [X,Y,60]
)



fn cambiar Traveler Inicio Fin =
(
	
	animate on 
	(
		at time (Inicio)
		(
			Traveler.scale = [1, 1, 0.5]
			rotate Traveler (eulerangles 0 0 0)
		)
		at time (Inicio + 2)
		(
			Traveler.scale = [1, 1, 2] 
		)
		at time ((Inicio+Fin)/2)
		(
			Traveler.scale = [1, 1, 1] 
		)
		at time (Fin - 2)
		(
			Traveler.scale = [1, 1, 2] 
		)
		at time (Fin)
		(
			Traveler.scale = [1, 1, 1]
			rotate Traveler (eulerangles 0 361 0)
			
		)
	)
)


fn Jump Traveler P1 P2 P3 Inicio Fin  =
(
	animate on
	(
		
		for t in Inicio to Fin by 1 do
		(
			at time t
			(
				Traveler.pos = interpolacionCuadratica Traveler t P1.pos P2 P3.pos
				cambiar Traveler Inicio Fin
			)
		)
		
	)
)





rollout Salto "Salto"
(
	label EActor "Actor:" 
	pickbutton UI_SelectorActor "Selecciona Actor"
	label EP1 "P1:" 
	pickbutton UI_SelectorP1 "Selecciona P1"
	label EP2 "P2:" 
	pickbutton UI_SelectorP2 "Selecciona P2"
	
	spinner UI_IF "Comienzo" range:[0,1000,0] type:#Integer
	spinner UI_FF "Duracion" range:[5,100,100] type:#Integer
	button UI_CrearSalto "Crear"
	
	on UI_SelectorActor picked obj do
	(
		global Traveler = obj
		UI_SelectorActor.text = obj.name
	)
	on UI_SelectorP1 picked obj do
	(
		global P1 = obj
		UI_SelectorP1.text = obj.name
	)
	on UI_SelectorP2 picked obj do
	(
		global P2 = obj
		UI_SelectorP2.text = obj.name
	)
	
	
	on UI_CrearSalto pressed do
	(
		  if Traveler!= undefined do
		  (
			  deletekeys Traveler
			  Traveler.dir = [0,0,1]
			  
			  pMedio = puntoMedio P1.pos P2.pos
				  
   	          Jump Traveler P1 pMedio P2 UI_IF.value (UI_IF.value+UI_FF.value)  
			  Traveler.showtrajectory = on
		  )
    )
)

createDialog Salto