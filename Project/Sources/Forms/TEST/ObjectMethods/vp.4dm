$event:=FORM Event:C1606

Case of 
	: ($event.code=On Load:K2:1)
		
	: ($event.code=On VP Ready:K2:59)
		
	: ($event.code=On Selection Change:K2:29)
		
		Form:C1466.html:=to_html("vp")
		
End case 