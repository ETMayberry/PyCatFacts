Sub VolumeUp
	Dim WshShell
    ' turn up the volume to maximum
    Set WshShell = CreateObject("WScript.Shell")
    ' key code "&hAD" = un-mute
    WshShell.SendKeys(chr(&hAD))
    For i = 1 To 100
    ' key code "&hAF" = volume up
        WshShell.SendKeys(chr(&hAF)) 
    Next
End Sub

Sub CatFact

	Dim o, sapi
    ' call for a cat fact
    Set o = CreateObject("WinHttp.WinHttpRequest.5.1")
    o.open "GET", "http://0.0.0.0/fact", False
    o.send

    ' text to speech
    Set sapi=CreateObject("sapi.spvoice") 
    sapi.Speak ("thank you for subscribing to cat facts")
    WScript.Sleep(1000)
    sapi.Speak o.responseText

End Sub

Do While True
	Dim s, s_min, s_max
	s_min = 30000
	s_max = 300000
	Randomize
	s = Int((s_max - s_min + 1) * Rnd + s_min)
	VolumeUp()
	CatFact()   
	WScript.Sleep(s) ' between 30 seconds and 5 minutes
Loop 