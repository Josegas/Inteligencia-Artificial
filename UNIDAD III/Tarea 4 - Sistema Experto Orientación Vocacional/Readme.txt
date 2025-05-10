Sistema Experto de Orientación Vocacional
Carrera: Ingeniería en Sistemas Computacionales
Materia: Inteligencia Artificial
Profesor: Zuriel Dathan Mora Félix
Equipo: García Pérez José Ángel, Verdugo Bermúdez Sebastián
Herramienta: SWI-Prolog

Descripción
Sistema experto en Prolog diseñado para ayudar a estudiantes y jóvenes profesionales a identificar la carrera más adecuada según sus intereses, habilidades y personalidad.

El sistema evalúa 10 áreas vocacionales mediante un cuestionario interactivo basado en lógica de predicados, generando recomendaciones personalizadas.

Características Principales
Base de conocimiento robusta:
150+ reglas lógicas organizadas en 10 áreas profesionales.
Preguntas dinámicas con validación de respuestas (si/no).

Motor de inferencia inteligente:
Backward-chaining para evaluar condiciones.
Memorización de respuestas (si/1, no/1) para evitar redundancias.

Cobertura amplia:
10 áreas vocacionales (Ciencias de la Salud, Ingeniería, Artes, Educación, etc.).
50+ carreras profesionales analizadas (Medicina, Diseño Gráfico, Turismo, etc.).

Interfaz intuitiva:
Cuestionario interactivo en consola.
Retroalimentación clara con la carrera recomendada.

Áreas Vocacionales Cubiertas
Área	Ejemplo de Carreras
1. Ciencias de la Salud 	Medicina, Enfermería, Psicología
2. Ingeniería y Tecnología	Ingeniería Civil, Sistemas, Mecatrónica
3. Ciencias Económico-Admin: 	Administración, Contabilidad, Finanzas
4. Ciencias Sociales	        Derecho, Sociología, Ciencias Políticas
5. Artes y Diseño	        Diseño Gráfico, Música, Arquitectura
6. Lenguas y Comunicación	Periodismo, Publicidad, Relaciones Públicas
7. Educación y Pedagogía	Educación Básica, Psicopedagogía
8. Ciencias Naturales	        Biología, Química, Geología
9. Turismo y Gastronomía	Turismo, Gastronomía, Hotelería
10. Ciencias del Deporte	Educación Física, Fisioterapia Deportiva

Estructura del Sistema
1. Base de Conocimiento
Reglas lógicas:

prolog
% Ejemplo: Medicina requiere interés en diagnosticar enfermedades
medicina :-
    pertenece_a_salud,
    verificar(diagnosticar_enfermedades),
    verificar(atender_pacientes).
Hechos dinámicos: si/1, no/1 para recordar respuestas.

2. Motor de Inferencia
Backward-chaining: Evalúa condiciones hasta encontrar la carrera más afín.

Ponderación implícita: Algunas carreras requieren más características específicas.

3. Interfaz de Usuario
Preguntas interactivas:

prolog
pregunta_texto(gusta_programar, "¿Te gusta programar?").
Validación de respuestas: Acepta si, no (con variantes como "sí", "NO").

Tecnología Utilizada
Lenguaje: Prolog (SWI-Prolog).
Paradigma: Programación lógica + reglas de inferencia.
Módulos:
OrientadorVocacional.pl (base de conocimiento).
InterfazOrientadorVocacional.pl (cuestionario interactivo).

Instrucciones de Uso
Ejecutar en SWI-Prolog:
prolog
?- [OrientadorVocacional.pl].  % Cargar el programa
?- orientar.                   % Iniciar cuestionario
Responder preguntas:
Ingresar si o no en cada pregunta.
Obtener resultados:
El sistema devuelve la carrera recomendada.

Ejemplo de Salida
¿Te gusta resolver problemas técnicos? (si/no): si  
¿Te interesa el desarrollo de software? (si/no): si  
...
La carrera que más se ajusta a tu perfil es: Ingeniería en Sistemas.