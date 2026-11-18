# Cocina del Sábado

App de la familia para comer balanceado, bajar grasa y ganar músculo sin salirse del presupuesto del mercado.
Funciona en el celular y en el computador, y se instala como app con su propio ícono.

**App:** <https://valclabs-sketch.github.io/cocina-del-sabado/>

## Qué hace
- **Hoy:** el plan del día de cada persona, hora por hora. El de él cambia según la hora a la que entrene; el de ella está pensado para el cardio de la noche; la niña come lo mismo en porción de su tamaño, sin dieta.
- **Almuerzo de la semana:** 8 recetas que se congelan bien, con calorías, proteína, costo por porción, pasos del sábado, número de recipientes y gramos a comprar.
- **Mercado:** lista completa (almuerzo + desayunos, cenas y meriendas), total contra el presupuesto, casillas para ir marcando en el supermercado y botón para copiar la lista a WhatsApp.
- **Progreso:** peso y cintura semanales de los dos adultos, con gráfica.
- **Familia y metas:** calorías (−20 %), proteína y rango de peso saludable de cada adulto.

## Puesta en marcha (una sola vez, ~5 minutos)
Usa el mismo proyecto de Supabase del Tablero ValClabs, con una tabla aparte.

1. Abre [`supabase/schema.sql`](supabase/schema.sql) y cambia los dos correos del final por el tuyo y el de tu esposo.
2. En Supabase → **SQL Editor**, pega el archivo completo y pulsa **Run**.
3. En Supabase → **Authentication → URL Configuration → Redirect URLs**, agrega `https://valclabs-sketch.github.io/cocina-del-sabado/` (para los correos de confirmación y de cambio de contraseña).
4. Cada uno abre la app y toca **Iniciar sesión**. Si ya tienes cuenta del Tablero, usa el mismo correo y contraseña. Tu esposo toca **Crear cuenta** (si el registro está cerrado en Supabase, créale la cuenta en **Authentication → Users → Add user**).

Solo los correos de la tabla `cocina_familia` pueden ver o cambiar estos datos.
> Ojo: una cuenta nueva en este proyecto de Supabase también puede abrir el Tablero ValClabs, porque el Tablero deja entrar a cualquier usuario con sesión. Si no quieres eso, crea un proyecto de Supabase aparte para la familia y cambia `config.js`.

Mientras no completes los pasos, la app funciona igual pero guarda los datos solo en ese celular.

## Instalar en el celular
- **iPhone:** abre la dirección en Safari → **Compartir** → **Agregar a pantalla de inicio**.
- **Android:** abre la dirección en Chrome → menú **⋮** → **Instalar app**.

## Archivos
| Archivo | Para qué sirve |
|---|---|
| `index.html` | Toda la app (recetas, cálculos y pantallas) |
| `config.js` | Conexión con Supabase (clave pública) |
| `supabase/schema.sql` | Tablas y permisos de la familia |
| `manifest.webmanifest`, `sw.js`, `assets/` | Instalación como app y uso sin internet |

Los precios vienen de referencia en pesos colombianos y se ajustan dentro de la app (pestaña Mercado).
Esta guía es orientativa: si alguien tiene una condición médica, validen las metas con su médico o nutricionista.
