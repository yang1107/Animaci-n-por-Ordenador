ball = sphere radius:8 wireColor:blue
p1 = box length:8 width:8 height:8 pos:[60,60,0] wireColor:red
p2 = box length:8 width:8 height:8 pos:[60,-60,0] wireColor:red
p3 = box length:8 width:8 height:8 pos:[-60,-60,0] wireColor:red
p4 = box length:8 width:8 height:8 pos:[-60,60,0] wireColor:red

fn interpolacionLineal Traveler t p1 p2 =(
	V = p2-p1
	return p1 + ((normalize V) * (((length V)/100)*t))
)

fn interpolacionCuadratica Traveler t p1 p2 p3 =(
	V1 = interpolacionLineal Traveler t p1 p2
	V2 = interpolacionLineal Traveler t p2 p3
	return (interpolacionLineal Traveler t V1 V2)
)

fn interpolacionCubica Traveler t p1 p2 p3 p4 =(
	V1 = interpolacionCuadratica Traveler t p1 p2 p3
	V2 = interpolacionCuadratica Traveler t p2 p3 p4
	return (interpolacionLineal Traveler t V1 V2)
)

animate on(
	for t in 0 to 100 by 1 do(
		at time t (
			ball.pos = interpolacionCubica ball t p1.pos p2.pos p3.pos p4.pos
		)
	)
)