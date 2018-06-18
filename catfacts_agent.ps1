# reference: https://gist.github.com/johnallers/178576f097a8a7986fcb17a92c88a486 
function speak {
    Add-Type -AssemblyName System.Speech

    $Catfact = Invoke-WebRequest -Uri 'http://127.0.0.1/fact' -UseBasicParsing | Select-Object -ExpandProperty 'Content'

    $Speaker = New-Object System.Speech.Synthesis.SpeechSynthesizer;
    $Speaker.Speak($Catfact);
}