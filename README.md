# Lulo y las Letras

Juego para que una niña de casi 6 años aprenda las letras con voz, gestos táctiles y dibujo, siguiendo los gestos del método Micho 1.

**Jugar:** https://javi0513.github.io/lulo-letras/ (mejor en Chrome, para que funcione el micrófono)

## Qué hay aquí

- `index.html`: el juego completo.
- `audio/`: las frases de Lulo grabadas con ElevenLabs (`manifest.js` dice cuáles hay).
- `frases.json` y `generar-voces.ps1`: para generar los audios que falten.
- `servidor.ps1` y `Jugar con Lulo.bat`: para jugar en el ordenador en http://localhost:8123/.

## Clave de voz

La clave de ElevenLabs (`clave-voz.txt`) **no se sube** a este repositorio: está en `.gitignore` y se queda solo en el ordenador.
