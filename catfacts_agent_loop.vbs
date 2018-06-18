Dim o, sapi, i

Do While True
    ' turn up the volume to maximum
    Set WshShell = CreateObject("WScript.Shell")
    ' key code "&hAD" = un-mute
    WshShell.SendKeys(chr(&hAD))
    For i = 1 To 100
    ' key code "&hAF" = volume up
        WshShell.SendKeys(chr(&hAF)) 
    Next

    ' call for a cat fact
    Set o = CreateObject("MSXML2.XMLHTTP")
    o.open "GET", "http://0.0.0.0/fact", False
    o.send

    ' text to speech
    Set sapi=CreateObject("sapi.spvoice") 
    sapi.Speak ("thank you for subscribing to cat facts")
    WScript.Sleep(1000)
    sapi.Speak o.responseText
    WScript.Sleep(30000)
End While