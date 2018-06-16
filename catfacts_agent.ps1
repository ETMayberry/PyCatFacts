function speak {
    Add-Type -AssemblyName System.Speech

    $Catfact = Invoke-WebRequest -Uri 'http://127.0.0.1/fact' -UseBasicParsing | Select-Object -ExpandProperty 'Content'

    $Speaker = New-Object System.Speech.Synthesis.SpeechSynthesizer;
    $Speaker.Speak($Catfact);
}