---
nombre: Lulo y las Letras
publicable: no        # sí / no. Por defecto "no"; solo lo cambia el usuario
cliente: no           # sí / no. Si es de un cliente, publicable queda en "no" salvo permiso expreso
estado: en desarrollo # idea / en desarrollo / terminado / en producción
actualizado: 2026-11-26
---
## Qué es
Un juego para aprender a leer en el que Lulo, una mascota con voz natural, enseña cada letra con voz, trazo táctil y minijuegos, y solo avanza cuando el niño la dice bien.

## Problema que resuelve
Para niños de 4 a 6 años que empiezan a leer (y sus padres): convierte el repaso de letras de casa en un juego que escucha, corrige y premia, sin que un adulto tenga que estar dirigiendo cada paso. Nació para la hija de Javi, que aprende con el método Micho 1 en el cole.

## Qué hace (3 a 5 puntos)
- Lección completa por letra: conocerla, decirla en voz alta, escribirla con el dedo siguiendo el trazo, encontrarla, darle de comer a Lulo la letra correcta arrastrándola a su boca, formar palabras arrastrando sílabas, leer palabras y terminar leyendo una frase.
- Escucha al niño con el micrófono y solo avanza cuando pronuncia bien la letra o la sílaba; si falla, Lulo le ayuda y vuelve a escuchar.
- Lulo habla con una voz natural y amable (audios pregrabados con IA, 1116 frases) y tiene vida propia: se ríe si le haces cosquillas, bosteza si dejas de jugar y anima a cada niño por su nombre.
- Premia cada acierto: estrellas, confeti y piezas de un dibujo (robot, cohete, dinosaurio...) que se completa al acabar la lección; dibujos y colores cambian cada vez.
- Mucho más que lecciones: 8 minijuegos con 3 niveles cada uno que suben solos al ir ganando (globos, pesca, emparejar, parejas de cartas, topos, escucha y toca, ¿qué sílaba falta? y "Eco" para grabarse), y cuentos por letra que avanzan al leer cada frase.
- Las letras se ven como en el cole: mayúsculas de imprenta y minúsculas en letra escolar ligada, igual que en el método Micho, también al escribirlas con el dedo.
- Recompensas que se ven: el rincón de Lulo con regalos que se desbloquean con estrellas (gafas, corona, sombrero de mago...) y una racha de días seguidos.
- Modo papá y mamá: qué letras le cuestan más y un juego por turnos para jugar en familia.
- Varios niños en el mismo aparato: al empezar, "¿Quién juega?" con un perfil por niño (solo nombre y edad, guardados en el aparato) y el progreso de cada uno.
- Repaso que comprueba lo aprendido: con 3 aciertos la letra queda "dominada" (corona en el mapa). Zona de padres con progreso, protegida con candado.

## Resultado o dato real
Pendiente. Funciona de principio a fin en el navegador (29 letras, 1378 frases grabadas, 8 juegos con niveles, publicado en GitHub Pages). Falta probarlo con la niña en un móvil real: buen dato para publicar será "letras dominadas en X semanas" o su reacción.

## Tecnologías
- HTML, CSS y JavaScript en un solo archivo (sin frameworks).
- Reconocimiento de voz del navegador (Web Speech API, español).
- ElevenLabs para la voz de Lulo (voz "Carlota").
- Canvas para el trazo de letras con el dedo.
- Publicado en GitHub Pages. Próximo paso: app Android para Google Play.

## Mejor material para publicar
- Nuevo (v8): `imagenes/menu-juegos-niveles.png` (los 8 juegos con sus estrellas de nivel), `imagenes/juego-topos.png` y `imagenes/juego-parejas.png` (los más llamativos), `imagenes/juego-que-falta.png`, `imagenes/juego-escucha.png`, y `imagenes/trazo-l-ligada.png` + `imagenes/mapa-letras-ligadas.png` para contar que las letras son las del cole (letra ligada).
- Nuevo (v7): `imagenes/rincon-de-lulo.png` (Lulo con gafas, flor y pajarita: ideal de portada), `imagenes/juego-globos.png`, `imagenes/juego-pesca.png`, `imagenes/cuento-letra-m.png` y `imagenes/juego-por-turnos.png`. Los nombres que salen (Ana) son de prueba.
- Nuevo (v6): `imagenes/dale-de-comer-a-lulo.png` y `imagenes/forma-la-palabra.png` enseñan los juegos de arrastrar; `imagenes/quien-juega.png` y `imagenes/registro-nombre-edad.png`, los perfiles. Los nombres que salen (Ana, Leo) son de prueba.
- `videos/leccion-letra-s-vertical.mp4` (28 s, 1080×1920, sin sonido): recorre buscar la letra, escribirla con el dedo, leer sílabas, leer "sapo" y el premio. Es el mejor para un reel; ponerle encima la voz de Lulo o música.
- `imagenes/escribe-la-letra.png` + `imagenes/premio-pegatina.png`: el antes y después de un acierto, muy visual.
- `imagenes/inicio.png` o `logo/lulo-y-titulo.png` como portada del carrusel.
- `imagenes/mapa-de-letras.png`: enseña el progreso (estrellas, coronas, barritas).
- Importante: no usar la pantalla "Conoce" con los dibujos de los gestos del Micho (son de la editorial). Las capturas de esta carpeta no los muestran.

## Ideas de publicación
- Carrusel: "Mi hija no reconocía las letras... porque no eran las del cole": antes (letra de imprenta) y después (letra ligada como en el Micho). Muy real y cercano.
- Reel: "Atrapa los topos de la letra": 10 segundos de topos saliendo cada vez más rápido (nivel 1 contra nivel 3).
- Carrusel: "Viste a Lulo": de Lulo normal a Lulo con corona y gafas, contando que los regalos se ganan leyendo.
- Reel: "Jugamos por turnos papá contra hija" con el marcador final.
- Reel: "El cuento se dibuja solo cuando lo lee": grabar el cuento de la M.
- Reel: "Dale de comer a Lulo": el dedo arrastra la letra a su boca y Lulo hace ñam ñam (grabar `dale-de-comer-a-lulo`). Muy llamativo para los primeros segundos.
- Carrusel: "Un juego que reconoce a cada niño": `registro-nombre-edad.png`, `quien-juega.png` y Lulo bostezando (`lulo-bosteza.png`).
- Reel: "Le hice a mi hija un juego para aprender a leer con IA". Grabar a la niña jugando (sin enseñar su cara si no quieres) + pantalla del juego.
- Carrusel: "Cómo funciona Lulo en 5 pasos": inicio, buscar letra, escribirla, leer sílabas, premio.
- Post: "Una voz que no suena a robot": antes/después de la voz del móvil frente a la voz de Lulo hecha con ElevenLabs.
- Reel corto: "Solo avanza si lo dice bien", mostrando el micrófono escuchando y Lulo celebrando.
- Más adelante: "De idea a Google Play", serie contando el camino hasta publicarla.
