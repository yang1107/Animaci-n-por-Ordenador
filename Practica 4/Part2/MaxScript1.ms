ball = sphere radius:10 wireColor:blue
animate on
( 
	at time 0   ball.pos = [-100,0,0]
	at time 100 ball.pos = [100,0,0]
)

b = Box width:10 length:10 height:10 wireColor:green
animate on
( 
	at time 0   b.pos = [-100,0,0]
	at time 25   b.pos = [-100,0,0]
	at time 100 b.pos = [100,0,0]
)



b2 = sphere radius:4 wireColor:red
animate on for t in 0 to 100 by 5 do
	at time t 
	(
		b2.pos = ball.pos + random [-15,-15,-15] [15,15,15]
		ball.radius = 8 + 3 * sin (720 * t / 100)
	)
                
b3 = sphere radius:8 wireColor:red
	animate on
( 
	at time 0   b3.pos = [0,100,0]
	at time 50   b3.pos = [0,100,0]
	at time 100 b3.pos = [0,-100,0]
)
