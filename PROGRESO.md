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
- [x] Probado en simulación (Playwright): juegos, cuentos, eco, rincón, turnos y lección completa sin errores.
- [x] index.html (MD5 e60383147c0e04a1fd6211fc0d5c54f6) y frases.json (1334 frases, MD5 c15980eb052dff5ab3ecd8c41a34a311) copiados a D:\Proyectos\lulo-letras.
- [x] Publicado (commit e7729ed): 1334 frases con audio, web comprobada.
- [x] Portfolio actualizado (portfolio.md + 7 capturas v7).

## En curso: v8 (pedido de Javi el 2026-11-26)
Código hecho en la copia maestra (scripts edit9.py y edit10.py). index.html MD5 3d5f5d906aa7960f99ec3520e8204121, frases.json 1378 frases (44 nuevas) MD5 27f12fb53ac742f26f62957750c31172.
- [x] Letras como en la lámina del Micho: MAYÚSCULAS de imprenta (Andika) y minúsculas en letra escolar ligada (Playwrite España, OFL), metidas en el HTML en base64 (familia `LuloLetra`, unicode-range). El trazo usa la misma letra. Nombres de niños en imprenta (`--font-print`).
- [x] Felicitaciones: `praise()` dice "¡Bien hecho!" y similares al tocar/arrastrar/escribir; `praise('voz')` (PRAISE_VOZ, "¡Bien dicho!") solo al hablar (voiceTask y Eco).
- [x] 4 juegos nuevos: Parejas (memoria), Topos, Escucha (dictado: letra, sílaba o palabra) y ¿Qué falta? (sílaba que falta).
- [x] Niveles 1-3 en los 8 juegos (S.gw[juego] = partidas terminadas; sube cada 2). Más rápido, más distractores y más difícil por nivel.
- [x] Probado en Playwright sin errores.
- [ ] Copiar a D:\Proyectos\lulo-letras, generar las 44 voces nuevas, commit + push.
- [ ] Portfolio v8.

## Siguiente
- Probarlo con la niña y ajustar lo que haga falta.
