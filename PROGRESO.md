# Lulo y las Letras: progreso (para retomar)

Juego: `D:\Proyectos\lulo-letras\index.html` (copia maestra en `/mnt/project-files/lulo-letras/index.html`).
Web: https://javi0513.github.io/lulo-letras/ (repo Javi0513/lulo-letras, rama main).
Voz: ElevenLabs "Carlota". Audios en `audio/`, se generan con `generar-voces.ps1` a partir de `frases.json` (todas las frases fijas que dice Lulo, objeto `T` y `allPhrases()` del index.html). La clave está en `clave-voz.txt` (no subirla nunca).

## Cómo publicar una versión
1. Exportar `frases.json` con `allPhrases()` (Playwright o consola del navegador: `copy(JSON.stringify(allPhrases(),null,1))`).
2. Copiar `index.html` y `frases.json` a `D:\Proyectos\lulo-letras` y comprobar el MD5.
3. `powershell -ExecutionPolicy Bypass -File .\generar-voces.ps1` (solo genera lo que falta).
4. `git add index.html frases.json audio` + commit + `git push origin main`.
5. Actualizar `portfolio\portfolio.md` y capturas.

## Hecho
- v5 (2026-11-24, commit 1ad14b8): lecciones completas, escucha continua, trazo por esqueleto, premios-dibujo por piezas, palabras y frase final.
- v6 (2026-11-25, commit 3ba88df): perfiles por niño (nombre + edad, solo en el aparato), "Dale de comer a Lulo" (arrastrar letra a la boca), "Forma la palabra" (arrastrar sílabas), Lulo se ríe al tocarlo, bosteza y anima por el nombre.

## En curso: v7 (pedido de Javi el 2026-11-25)
Código hecho en la copia maestra (script de cambios: edit8.py). Funciones: goGames, gameGlobos, gamePesca, gameEmpareja, gameEco, goStories, story, CUENTOS, goCorner, ACCS, dressLulos, streak/markDay, turnGame, panel "Letras que más le cuestan" (S.miss/S.hit) en la Zona de padres.
- [x] 3. Minijuegos: pantalla "Juegos" con Globos, Pesca, Empareja (arrastrar palabra al dibujo) y Eco.
- [x] 4. Cuentos: pantalla "Cuentos", 3 frases por letra aprendida; cada frase leída añade dibujos a la escena.
- [x] 5. Eco: Lulo dice sílaba o palabra, el niño se graba (MediaRecorder) y oye las dos voces.
- [x] 6. Rincón de Lulo: 8 regalos que se desbloquean con estrellas (no se gastan) y se ven en Lulo en todo el juego; racha de días seguidos (llama en el inicio).
- [x] 7. Zona de padres: letras que más cuestan (con botón Practicar) y juego por turnos (niños + papá o mamá).
- [ ] Probar, generar voces, publicar, actualizar portfolio.
