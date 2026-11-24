# Genera los audios de Lulo con ElevenLabs.
# Uso:  powershell -ExecutionPolicy Bypass -File generar-voces.ps1 -Voz <id_de_voz>
# La clave se lee de clave-voz.txt (no la compartas ni la subas a internet).
# Solo genera las frases que aun no tienen audio, asi que se puede repetir sin gastar de mas.
param(
  [string]$Voz = "",
  [string]$Solo = ""          # opcional: genera solo esta frase (para muestras)
)
$ErrorActionPreference = "Stop"
$dir = Split-Path -Parent $MyInvocation.MyCommand.Path
$clave = (Get-Content (Join-Path $dir "clave-voz.txt") -Raw).Trim()
if (-not $Voz) { $Voz = (Get-Content (Join-Path $dir "voz.txt") -Raw).Trim() }
$frases = Get-Content (Join-Path $dir "frases.json") -Raw -Encoding UTF8 | ConvertFrom-Json
if ($Solo) { $frases = $frases | Where-Object { $_.text -eq $Solo } }
$audio = Join-Path $dir "audio"
New-Item -ItemType Directory -Force $audio | Out-Null
$hechos = 0; $fallos = 0; $i = 0
foreach ($f in $frases) {
  $i++
  $out = Join-Path $audio ($f.key + ".mp3")
  if (Test-Path $out) { continue }
  # Frases muy cortas (silabas): modelo que permite fijar el idioma espanol para que no las lea en ingles.
  if ($f.text.Length -le 4) {
    $b = @{ text = $f.text; model_id = "eleven_turbo_v2_5"; language_code = "es" }
  } else {
    $b = @{ text = $f.text; model_id = "eleven_multilingual_v2" }
  }
  $b.voice_settings = @{ stability = 0.55; similarity_boost = 0.8; style = 0.15; use_speaker_boost = $true; speed = 0.92 }
  $json = $b | ConvertTo-Json -Depth 4
  try {
    Invoke-WebRequest -UseBasicParsing -Method Post `
      -Uri ("https://api.elevenlabs.io/v1/text-to-speech/" + $Voz + "?output_format=mp3_44100_128") `
      -Headers @{ "xi-api-key" = $clave } -ContentType "application/json; charset=utf-8" `
      -Body ([Text.Encoding]::UTF8.GetBytes($json)) -OutFile $out
    $hechos++
    Write-Host ("[{0}/{1}] {2}" -f $i, $frases.Count, $f.text)
  } catch {
    $fallos++
    if (Test-Path $out) { Remove-Item $out }
    Write-Host ("FALLO: {0} -> {1}" -f $f.text, $_.Exception.Message)
    if ($fallos -ge 5) { Write-Host "Demasiados fallos, paro."; break }
  }
}
$keys = Get-ChildItem $audio -Filter *.mp3 | ForEach-Object { '"' + $_.BaseName + '":1' }
("window.LULO_AUDIO={" + ($keys -join ",") + "};") | Set-Content (Join-Path $audio "manifest.js") -Encoding ASCII
Write-Host ("Listo: {0} audios nuevos, {1} fallos. Total en la carpeta: {2}" -f $hechos, $fallos, $keys.Count)
