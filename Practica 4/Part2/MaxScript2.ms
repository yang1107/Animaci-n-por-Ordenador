objeto1 = sphere radius:10 wireColor:blue
objeto2 = Box width:10 length:10 height:10 wireColor:green
objeto3 = sphere radius:4 wireColor:red
objeto4 = sphere radius:8 wireColor:red


animate on
(
	at time 0(
		objeto1.pos = [-100,0,0]
		objeto3.pos = [0,100,0]
	)
	at time 35 objeto3.pos = [0,100,0]
		
	at time 100(
		objeto1.pos = [100,0,0]
		objeto3.pos = [0,-100,0]
	)
	
	
)




animate on for t in 0 to 100 by 5 do
	at time t 
	(
		objeto2.pos = objeto1.pos + random [-15,-15,-15] [15,15,15]
		objeto4.pos = objeto3.pos + [-15,5,0]
	)
                

