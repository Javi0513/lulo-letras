# Servidor web minimo para jugar a Lulo y las Letras en http://localhost:8123/
# Solo escucha en este ordenador y solo sirve archivos del juego de esta carpeta.
$ErrorActionPreference = 'Continue'
$puerto = 8123
$url = "http://localhost:$puerto/"
$raiz = [System.IO.Path]::GetFullPath($PSScriptRoot).TrimEnd('\') + '\'

# Solo se sirven estos tipos de archivo (asi nunca se sirve clave-voz.txt ni los scripts)
$tipos = @{
  '.html' = 'text/html; charset=utf-8'
  '.htm'  = 'text/html; charset=utf-8'
  '.js'   = 'application/javascript; charset=utf-8'
  '.css'  = 'text/css; charset=utf-8'
  '.json' = 'application/json; charset=utf-8'
  '.mp3'  = 'audio/mpeg'
  '.wav'  = 'audio/wav'
  '.ogg'  = 'audio/ogg'
  '.png'  = 'image/png'
  '.jpg'  = 'image/jpeg'
  '.jpeg' = 'image/jpeg'
  '.webp' = 'image/webp'
  '.svg'  = 'image/svg+xml'
  '.ico'  = 'image/x-icon'
  '.woff' = 'font/woff'
  '.woff2'= 'font/woff2'
  '.ttf'  = 'font/ttf'
  '.webmanifest' = 'application/manifest+json'
}

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add($url)
try {
  $listener.Start()
} catch {
  # El puerto ya esta en uso: seguramente el servidor ya esta abierto
  Start-Process $url
  exit
}

Write-Host "Lulo esta en $url  (cierra esta ventana para apagarlo)"
Start-Process $url

function Send-Text($res, $code, $texto) {
  $res.StatusCode = $code
  $bytes = [System.Text.Encoding]::UTF8.GetBytes($texto)
  $res.ContentType = 'text/plain; charset=utf-8'
  $res.ContentLength64 = $bytes.Length
  $res.OutputStream.Write($bytes, 0, $bytes.Length)
}

while ($listener.IsListening) {
  $ctx = $null
  try {
    $ctx = $listener.GetContext()
    $req = $ctx.Request
    $res = $ctx.Response
    $res.Headers['Cache-Control'] = 'no-cache'

    $ruta = [System.Uri]::UnescapeDataString($req.Url.AbsolutePath)
    if ($ruta -eq '/' -or $ruta -eq '') { $ruta = '/index.html' }
    $relativa = $ruta.TrimStart('/').Replace('/', '\')
    $completa = [System.IO.Path]::GetFullPath((Join-Path $raiz $relativa))
    $ext = [System.IO.Path]::GetExtension($completa).ToLower()

    if (-not $completa.StartsWith($raiz, [System.StringComparison]::OrdinalIgnoreCase)) {
      Send-Text $res 403 'Prohibido'
    } elseif (-not $tipos.ContainsKey($ext)) {
      Send-Text $res 404 'No encontrado'
    } elseif (-not [System.IO.File]::Exists($completa)) {
      Send-Text $res 404 'No encontrado'
    } else {
      $bytes = [System.IO.File]::ReadAllBytes($completa)
      $res.StatusCode = 200
      $res.ContentType = $tipos[$ext]
      $res.ContentLength64 = $bytes.Length
      if ($req.HttpMethod -ne 'HEAD') { $res.OutputStream.Write($bytes, 0, $bytes.Length) }
    }
  } catch {
    Write-Host "Error en una peticion: $($_.Exception.Message)"
    try { if ($ctx) { $ctx.Response.StatusCode = 500 } } catch {}
  } finally {
    try { if ($ctx) { $ctx.Response.OutputStream.Close() } } catch {}
  }
}
