% Sistema Experto de Orientación Vocacional - Ciencias de la Salud e Ingeniería

:- dynamic si/1, no/1.

% Ejecución principal
orientar :-
    limpiar_respuestas,
    writeln("Bienvenido al sistema experto de orientacion vocacional"),
    predecir(Carrera),
    write('La carrera que mas se ajusta a tu perfil es: '),
    write(Carrera), write('.'), nl, !.

% Predicciones posibles

% Carreras para Ciencias de la Salud    
predecir(medicina) :- medicina.
predecir(enfermeria) :- enfermeria.
predecir(psicologia) :- psicologia.
predecir(nutricion) :- nutricion.

% Carreras para Ingeniería y Tecnología
predecir(ingenieria_civil) :- ingenieria_civil.
predecir(ingenieria_mecanica) :- ingenieria_mecanica.
predecir(ingenieria_industrial) :- ingenieria_industrial.
predecir(ingenieria_electronica) :- ingenieria_electronica.
predecir(ingenieria_mecatronica) :- ingenieria_mecatronica.
predecir(ingenieria_sistemas) :- ingenieria_sistemas.

% Carreras para Ciencias Económico-Administrativas
predecir(administracion) :- administracion.
predecir(contabilidad) :- contabilidad.
predecir(finanzas) :- finanzas.
predecir(marketing) :- marketing.
predecir(negocios_internacionales) :- negocios_internacionales.

% Carreras para Ciencias Sociales y Humanidades
predecir(derecho) :- derecho.
predecir(sociologia) :- sociologia.
predecir(historia) :- historia.
predecir(ciencias_politicas) :- ciencias_politicas.
predecir(filosofia) :- filosofia.

% Carreras para Artes y Diseño
predecir(artes_visuales) :- artes_visuales.
predecir(diseno_grafico) :- diseno_grafico.
predecir(musica) :- musica.
predecir(cine) :- cine.
predecir(arquitectura) :- arquitectura.

% Carreras para Lenguas y Comunicación
predecir(periodismo) :- periodismo.
predecir(publicidad) :- publicidad.
predecir(traduccion) :- traduccion.
predecir(relaciones_publicas) :- relaciones_publicas.
predecir(comunicacion) :- comunicacion.

% Carreras para Educación y Pedagogía
predecir(educacion_basica) :- educacion_basica.
predecir(educacion_especial) :- educacion_especial.
predecir(psicopedagogia) :- psicopedagogia.

% Carreras para Ciencias Naturales y Ambientales
predecir(biologia) :- biologia.
predecir(quimica) :- quimica.
predecir(fisica) :- fisica.
predecir(ciencias_ambientales) :- ciencias_ambientales.
predecir(geologia) :- geologia.

% Carreras para Turismo, Gastronomía y Servicios
predecir(turismo) :- turismo.
predecir(hoteleria) :- hoteleria.
predecir(gastronomia) :- gastronomia.
predecir(organizacion_eventos) :- organizacion_eventos.
predecir(guia_viajes) :- guia_viajes.

% Carreras para Ciencias del Deporte
predecir(educacion_fisica) :- educacion_fisica.
predecir(entrenamiento_deportivo) :- entrenamiento_deportivo.
predecir(fisioterapia_deportiva) :- fisioterapia_deportiva.
predecir(kinesiologia) :- kinesiologia.

% Predicción por defecto si no se encuentra una carrera
predecir('No se encontró una carrera').

% Reglas de cada carrera (Ciencias de la Salud)
medicina :-
    pertenece_a_salud,
    verificar(diagnosticar_enfermedades),
    verificar(atender_pacientes),
    verificar(salvar_vidas).

enfermeria :-
    pertenece_a_salud,
    verificar(cuidar_pacientes),
    verificar(apoyar_tratamientos),
    verificar(contacto_con_personas).

psicologia :-
    pertenece_a_salud,
    verificar(interes_mente_humana),
    verificar(ayudar_problemas_emocionales).

nutricion :-
    pertenece_a_salud,
    verificar(interes_en_alimentacion),
    verificar(ayudar_comer_mejor).

% Reglas de cada carrera (Ingeniería y Tecnología)
ingenieria_civil :-
    pertenece_a_ing_tec,
    verificar(diseniar_puentes),
    verificar(diseniar_edificios),
    verificar(diseniar_caminos).

ingenieria_mecanica :-
    pertenece_a_ing_tec,
    verificar(interes_maquinas),
    verificar(interes_mecanismos),
    verificar(interes_mecanica).

ingenieria_industrial :-
    pertenece_a_ing_tec,
    verificar(mejorar_procesos),
    verificar(optimizar_recursos),
    verificar(gusto_numeros).

ingenieria_electronica :-
    pertenece_a_ing_tec,
    verificar(atraen_circuitos),
    verificar(interes_sensores),
    verificar(interes_sistemas_electricos).

ingenieria_mecatronica :-
    pertenece_a_ing_tec,
    verificar(interes_mecanica),
    verificar(interes_electronica),
    verificar(interes_automatizacion).

ingenieria_sistemas :-
    pertenece_a_ing_tec,
    verificar(interes_software),
    verificar(interes_redes),
    verificar(interes_sistemas_informaticos).

% Reglas de cada carrera (Ciencias Económico-Administrativas)
administracion :-
    pertenece_a_econ_admin,
    verificar(interes_empresas),
    verificar(gusta_liderar),
    verificar(gusta_organizar),
    verificar(gusta_planificar).

contabilidad :-
    pertenece_a_econ_admin,
    verificar(gusta_numeros),
    verificar(interes_control_financiero),
    verificar(eres_detallista),
    verificar(eres_ordenado).

finanzas :-
    pertenece_a_econ_admin,
    verificar(interes_inversion),
    verificar(interes_riesgos),
    verificar(interes_economia).

marketing :-
    pertenece_a_econ_admin,
    verificar(interes_publicidad),
    verificar(interes_creatividad),
    verificar(interes_ventas).

negocios_internacionales :-
    pertenece_a_econ_admin,
    verificar(interes_comercio_global),
    verificar(interes_idiomas),
    verificar(interes_relaciones_internacionales).

% Reglas de cada carrera (Ciencias Sociales y Humanidades)
derecho :-
    pertenece_a_sociales_humanidades,
    verificar(interes_justicia),
    verificar(interes_leyes),
    verificar(interes_defender_causas).

sociologia :-
    pertenece_a_sociales_humanidades,
    verificar(entender_funcionamiento_sociedad),
    verificar(entender_problemas_sociales).

historia :-
    pertenece_a_sociales_humanidades,
    verificar(pasion_pasado),
    verificar(interes_implicaciones_pasado_presente).

ciencias_politicas :-
    pertenece_a_sociales_humanidades,
    verificar(interes_gobiernos),
    verificar(interes_politica),
    verificar(interes_sistemas_poder).

filosofia :-
    pertenece_a_sociales_humanidades,
    verificar(gusta_pensar),
    verificar(gusta_cuestionar),
    verificar(gusta_analizar_ideas).

% Reglas de cada carrera (Artes y Diseño)
artes_visuales :-
    pertenece_a_artes_diseno,
    verificar(gusta_pintar),
    verificar(gusta_dibujar),
    verificar(gusta_esculpir),
    verificar(gusta_explorar_medios_visuales).

diseno_grafico :-
    pertenece_a_artes_diseno,
    verificar(gusta_comunicacion_visual),
    verificar(gusta_tipografia),
    verificar(gusta_diseno_digital).

musica :-
    pertenece_a_artes_diseno,
    verificar(disfruta_tocar_instrumentos),
    verificar(disfruta_componer_musica),
    verificar(disfruta_ensenar_musica).

cine :-
    pertenece_a_artes_diseno,
    verificar(interes_contar_historias_audiovisuales).

arquitectura :-
    pertenece_a_artes_diseno,
    verificar(gusta_diseno_espacios),
    verificar(gusta_planos),
    verificar(gusta_arte_funcionalidad).

% Reglas de cada carrera (Lenguas y Comunicación)
periodismo :-
    pertenece_a_lenguas_comunicacion,
    verificar(interes_informar),
    verificar(interes_investigar),
    verificar(interes_comunicar_noticias).

publicidad :-
    pertenece_a_lenguas_comunicacion,
    verificar(gusta_persuadir),
    verificar(gusta_crear_campanas),
    verificar(gusta_atraer_publico).

traduccion :-
    pertenece_a_lenguas_comunicacion,
    verificar(gusta_idiomas),
    verificar(interes_precision_lenguaje).

relaciones_publicas :-
    pertenece_a_lenguas_comunicacion,
    verificar(disfruta_interactuar),
    verificar(disfruta_organizar_eventos),
    verificar(disfruta_gestionar_imagen_publica).

comunicacion :-
    pertenece_a_lenguas_comunicacion,
    verificar(interes_television),
    verificar(interes_radio),
    verificar(interes_medios_digitales).

% Reglas de cada carrera (Educación y Pedagogía)
educacion_basica :-
    pertenece_a_educacion_pedagogia,
    verificar(querer_ensenar_ninos),
    verificar(formar_bases_educativas).

educacion_especial :-
    pertenece_a_educacion_pedagogia,
    verificar(interes_apoyar_necesidades_especiales).

psicopedagogia :-
    pertenece_a_educacion_pedagogia,
    verificar(interes_entender_aprendizaje),
    verificar(querer_ayudar_proceso_aprendizaje).

% Reglas de cada carrera (Ciencias Naturales y Ambientales)
biologia :-
    pertenece_a_ciencias_naturales,
    verificar(interes_vida),
    verificar(interes_ecosistemas),
    verificar(interes_seres_vivos).

quimica :-
    pertenece_a_ciencias_naturales,
    verificar(interes_sustancias),
    verificar(interes_reacciones_quimicas),
    verificar(interes_investigacion_laboratorio).

fisica :-
    pertenece_a_ciencias_naturales,
    verificar(gusta_entender_funcionamiento_universo).

ciencias_ambientales :-
    pertenece_a_ciencias_naturales,
    verificar(preocupacion_medio_ambiente),
    verificar(interes_sostenibilidad).

geologia :-
    pertenece_a_ciencias_naturales,
    verificar(interes_rocas),
    verificar(interes_suelo),
    verificar(interes_procesos_terrestres).

% Reglas de cada carrera (Turismo, Gastronomía y Servicios)
turismo :-
    pertenece_a_turismo_gastronomia,
    verificar(interes_mostrar_lugares),
    verificar(interes_planear_rutas),
    verificar(interes_conocer_culturas).

hoteleria :-
    pertenece_a_turismo_gastronomia,
    verificar(interes_atencion_cliente),
    verificar(interes_organizacion_alojamientos).

gastronomia :-
    pertenece_a_turismo_gastronomia,
    verificar(pasion_cocinar),
    verificar(gusta_crear_platos_nuevos).

organizacion_eventos :-
    pertenece_a_turismo_gastronomia,
    verificar(gusta_coordinar),
    verificar(gusta_planificar),
    verificar(gusta_organizar_actividades).

guia_viajes :-
    pertenece_a_turismo_gastronomia,
    verificar(encanta_compartir_lugares),
    verificar(encanta_compartir_culturas).

% Reglas de cada carrera (Ciencias del Deporte)
educacion_fisica :-
    pertenece_a_deporte_actividad_fisica,
    verificar(querer_ensenar_deporte),
    verificar(querer_promover_habitos_saludables).

entrenamiento_deportivo :-
    pertenece_a_deporte_actividad_fisica,
    verificar(querer_ayudar_rendimiento_fisico).

fisioterapia_deportiva :-
    pertenece_a_deporte_actividad_fisica,
    verificar(interes_tratar_lesiones_deportivas),
    verificar(interes_recuperar_atletas).

kinesiologia :-
    pertenece_a_deporte_actividad_fisica,
    verificar(interes_movimiento_corporal),
    verificar(interes_relacion_movimiento_salud).

% Área Ciencias de la Salud
pertenece_a_salud :-
    verificar(ayudar_salud), !.
pertenece_a_salud :-
    verificar(interes_cuerpo),
    verificar(interes_medicina),
    verificar(interes_bienestar), !.
pertenece_a_salud :-
    verificar(empatico),
    verificar(observador),
    verificar(responsable).

% Área Ingeniería y Tecnología
pertenece_a_ing_tec :-
    verificar(resolver_problemas_tecnicos), !.
pertenece_a_ing_tec :-
    verificar(mejorar_procesos), !.
pertenece_a_ing_tec :-
    verificar(interes_maquinas),
    verificar(interes_sistemas),
    verificar(interes_estructuras), !.
pertenece_a_ing_tec :-
    verificar(gusto_numeros),
    verificar(gusto_logica),
    verificar(gusto_tecnologia).

% Verificación con memorización
verificar(Caracteristica) :-
    si(Caracteristica), !.
verificar(Caracteristica) :-
    no(Caracteristica), !, fail.
verificar(Caracteristica) :-
    preguntar(Caracteristica).

% Área Económico-Administrativa
pertenece_a_econ_admin :-
    verificar(interes_funcionamiento_dinero),
    verificar(interes_empresas),
    verificar(interes_mercado), !.
pertenece_a_econ_admin :-
    verificar(gusta_organizar),
    verificar(gusta_planificar),
    verificar(gusta_decisiones_financieras), !.
pertenece_a_econ_admin :-
    verificar(eres_analitico),
    verificar(eres_ordenado),
    verificar(interes_emprender), !.
pertenece_a_econ_admin :-
    verificar(gusta_numeros),
    verificar(gusta_logica),
    verificar(interes_control_financiero).

% Área Ciencias Sociales y Humanidades
pertenece_a_sociales_humanidades :-
    verificar(interes_entender_sociedad),
    verificar(interes_entender_personas),
    verificar(interes_historia), !.
pertenece_a_sociales_humanidades :-
    verificar(gusta_leer); 
    verificar(gusta_debatir); 
    verificar(gusta_reflexionar), !.
pertenece_a_sociales_humanidades :-
    verificar(motiva_justicia); 
    verificar(motivan_derechos); 
    verificar(interes_comportamiento_humano), !.
pertenece_a_sociales_humanidades :-
    verificar(gusta_pensar),
    verificar(gusta_cuestionar),
    verificar(gusta_analizar_ideas).

% Área Artes y Diseño
pertenece_a_artes_diseno :-
    verificar(eres_creativo),
    verificar(gusta_expresarse_visual_musicalmente), !.

pertenece_a_artes_diseno :-
    verificar(pasion_diseno),
    verificar(pasion_estetica),
    verificar(pasion_arte_general), !.

pertenece_a_artes_diseno :-
    verificar(disfruta_crear_cosas_nuevas).

% Área Lenguas y Comunicación
pertenece_a_lenguas_comunicacion :-
    (verificar(pasion_idiomas); verificar(pasion_escritura); verificar(pasion_hablar_publico)), !.

pertenece_a_lenguas_comunicacion :-
    verificar(interes_transmitir_ideas),
    verificar(interes_conectar_otros), !.

pertenece_a_lenguas_comunicacion :-
    verificar(eres_expresivo),
    verificar(eres_creativo),
    verificar(gusta_comunicarse), !.

pertenece_a_lenguas_comunicacion :-
    verificar(gusta_idiomas),
    verificar(interes_precision_lenguaje).

% Área Educación y Pedagogía
pertenece_a_educacion_pedagogia :-
    verificar(gusta_ensenar),
    verificar(gusta_acompanar_aprendizaje),
    verificar(gusta_compartir_conocimientos), !.

pertenece_a_educacion_pedagogia :-
    verificar(eres_paciente),
    verificar(eres_empatico),
    verificar(interes_trabajar_con_ninos_jovenes), !.

% Área Ciencias Naturales y Ambientales
pertenece_a_ciencias_naturales :-
    verificar(interes_naturaleza),
    verificar(interes_medio_ambiente),
    verificar(interes_fenomenos_fisicos), !.

pertenece_a_ciencias_naturales :-
    verificar(pasion_investigar),
    verificar(pasion_observar),
    verificar(pasion_experimentar), !.

pertenece_a_ciencias_naturales :-
    verificar(interes_vida),
    verificar(interes_ecosistemas),
    verificar(interes_seres_vivos).

% Área Turismo, Gastronomía y Servicios
pertenece_a_turismo_gastronomia :-
    verificar(interes_viajar); 
    verificar(interes_atender_personas); 
    verificar(interes_crear_experiencias), !.

pertenece_a_turismo_gastronomia :-
    verificar(gusta_cocina); 
    verificar(gusta_idiomas); 
    verificar(gusta_eventos), !.

% Área Ciencias del Deporte y Actividad Física
pertenece_a_deporte_actividad_fisica :-
    verificar(disfruta_ejercicio),
    verificar(practica_deportes),
    verificar(gusta_mantenerse_activo), !.

pertenece_a_deporte_actividad_fisica :-
    verificar(interes_rendimiento_fisico),
    verificar(interes_cuerpo_humano),
    verificar(interes_entrenamiento), !.

    
% Preguntar al usuario (solo acepta "si" o "no")
preguntar(Pregunta) :-
    pregunta_texto(Pregunta, Texto),
    repetir_pregunta(Pregunta, Texto).

% Repite la pregunta hasta que se reciba "si" o "no"
repetir_pregunta(Pregunta, Texto) :-
    write(Texto), write(' (si/no): '),
    read_line_to_string(user_input, Resp),
    nl,
    (Resp = "si" ->
        assertz(si(Pregunta))
    ; Resp = "no" ->
        assertz(no(Pregunta)), fail
    ; writeln("Por favor, responde solo con 'si' o 'no'."),
      repetir_pregunta(Pregunta, Texto)
    ).

% Texto de preguntas (mapa legible)

% Preguntas para area Ciencias de la Salud
pregunta_texto(ayudar_salud, "Te interesa ayudar a las personas a mejorar su salud?").
pregunta_texto(interes_cuerpo, "Te interesa el cuerpo humano?").
pregunta_texto(interes_medicina, "Te interesa la medicina?").
pregunta_texto(interes_bienestar, "Te interesa el bienestar?").
pregunta_texto(empatico, "Eres empatico?").
pregunta_texto(observador, "Eres observador?").
pregunta_texto(responsable, "Eres responsable?").
pregunta_texto(diagnosticar_enfermedades, "Quieres diagnosticar enfermedades?").
pregunta_texto(atender_pacientes, "Quieres atender pacientes?").
pregunta_texto(salvar_vidas, "Quieres salvar vidas?").
pregunta_texto(cuidar_pacientes, "Te interesa cuidar pacientes?").
pregunta_texto(apoyar_tratamientos, "Quieres apoyar tratamientos medicos?").
pregunta_texto(contacto_con_personas, "Quieres estar en contacto con personas?").
pregunta_texto(interes_mente_humana, "Te interesa comprender la mente humana?").
pregunta_texto(ayudar_problemas_emocionales, "Quieres ayudar con problemas emocionales o conductuales?").
pregunta_texto(interes_en_alimentacion, "Te interesa como la alimentacion influye en la salud?").
pregunta_texto(ayudar_comer_mejor, "Quieres ayudar a otros a comer mejor?").

% Preguntas para area Ingenieria y Tecnologia
pregunta_texto(resolver_problemas_tecnicos, "Disfrutas resolver problemas tecnicos?").
pregunta_texto(mejorar_procesos, "Te gusta mejorar procesos?").
pregunta_texto(interes_maquinas, "Te interesa como funcionan las maquinas?").
pregunta_texto(interes_sistemas, "Te interesan los sistemas?").
pregunta_texto(interes_estructuras, "Te interesan las estructuras?").
pregunta_texto(gusto_numeros, "Te gusta trabajar con numeros?").
pregunta_texto(gusto_logica, "Te gusta la logica?").
pregunta_texto(gusto_tecnologia, "Te gusta la tecnologia?").
pregunta_texto(diseniar_puentes, "Te interesa diseniar puentes?").
pregunta_texto(diseniar_edificios, "Te interesa diseniar edificios?").
pregunta_texto(diseniar_caminos, "Te interesa diseniar caminos?").
pregunta_texto(interes_mecanismos, "Te interesan los mecanismos?").
pregunta_texto(optimizar_recursos, "Quieres optimizar recursos?").
pregunta_texto(atraen_circuitos, "Te atraen los circuitos?").
pregunta_texto(interes_sensores, "Te interesan los sensores?").
pregunta_texto(interes_sistemas_electricos, "Te interesan los sistemas electricos?").
pregunta_texto(interes_mecanica, "Te interesa la mecanica?").
pregunta_texto(interes_electronica, "Te interesa la electronica?").
pregunta_texto(interes_automatizacion, "Te interesa la automatizacion?").
pregunta_texto(interes_software, "Te interesa el software?").
pregunta_texto(interes_redes, "Te interesan las redes?").
pregunta_texto(interes_sistemas_informaticos, "Te interesan los sistemas informaticos?").

% Preguntas para area economico-administrativa
pregunta_texto(interes_funcionamiento_dinero, "Te interesa como funciona el dinero?").
pregunta_texto(interes_empresas, "Te interesan las empresas?").
pregunta_texto(interes_mercado, "Te interesa el mercado?").
pregunta_texto(gusta_organizar, "Te gusta organizar?").
pregunta_texto(gusta_planificar, "Te gusta planificar?").
pregunta_texto(gusta_decisiones_financieras, "Te gusta tomar decisiones financieras?").
pregunta_texto(eres_analitico, "Eres analitico?").
pregunta_texto(eres_ordenado, "Eres ordenado?").
pregunta_texto(interes_emprender, "Te interesa emprender?").
pregunta_texto(gusta_liderar, "Te gusta liderar?").
pregunta_texto(gusta_coordinar_recursos, "Te gusta coordinar recursos?").
pregunta_texto(eres_detallista, "Eres detallista?").
pregunta_texto(interes_control_financiero, "Te interesa el control financiero?").
pregunta_texto(interes_inversion, "Te interesa la inversion?").
pregunta_texto(interes_riesgos, "Te interesan los riesgos?").
pregunta_texto(interes_economia, "Te interesa la economia?").
pregunta_texto(interes_publicidad, "Te llama la atencion la publicidad?").
pregunta_texto(interes_creatividad, "Te llama la atencion la creatividad?").
pregunta_texto(interes_ventas, "Te llaman la atencion las ventas?").
pregunta_texto(interes_comercio_global, "Te interesa el comercio global?").
pregunta_texto(interes_idiomas, "Te interesan los idiomas?").
pregunta_texto(interes_relaciones_internacionales, "Te interesan las relaciones internacionales?").

% Preguntas para area Ciencias Sociales y Humanidades
pregunta_texto(interes_entender_sociedad, "Te interesa entender la sociedad?").
pregunta_texto(interes_entender_personas, "Te interesa entender a las personas?").
pregunta_texto(interes_historia, "Te interesa la historia?").
pregunta_texto(gusta_leer, "Te gusta leer?").
pregunta_texto(gusta_debatir, "Te gusta debatir?").
pregunta_texto(gusta_reflexionar, "Te gusta reflexionar?").
pregunta_texto(motiva_justicia, "Te motiva la justicia?").
pregunta_texto(motivan_derechos, "Te motivan los derechos humanos?").
pregunta_texto(interes_comportamiento_humano, "Te interesa el comportamiento humano?").
pregunta_texto(interes_justicia, "Te interesa la justicia?").
pregunta_texto(interes_leyes, "Te interesan las leyes?").
pregunta_texto(interes_defender_causas, "Te interesa defender causas?").
pregunta_texto(entender_funcionamiento_sociedad, "Quieres entender como funciona la sociedad?").
pregunta_texto(entender_problemas_sociales, "Quieres entender los problemas sociales?").
pregunta_texto(pasion_pasado, "Te apasiona el pasado?").
pregunta_texto(interes_implicaciones_pasado_presente, "Te interesan las implicaciones del pasado en el presente?").
pregunta_texto(interes_gobiernos, "Te interesan los gobiernos?").
pregunta_texto(interes_politica, "Te interesa la politica?").
pregunta_texto(interes_sistemas_poder, "Te interesan los sistemas de poder?").
pregunta_texto(gusta_pensar, "Te gusta pensar?").
pregunta_texto(gusta_cuestionar, "Te gusta cuestionar?").
pregunta_texto(gusta_analizar_ideas, "Te gusta analizar ideas?").

% Preguntas para area Artes y Diseno
pregunta_texto(eres_creativo, "Te consideras una persona creativa?").
pregunta_texto(gusta_expresarse_visual_musicalmente, "Te gusta expresarte visual o musicalmente?").
pregunta_texto(pasion_diseno, "Te apasiona el diseno?").
pregunta_texto(pasion_estetica, "Te apasiona la estetica?").
pregunta_texto(pasion_arte_general, "Te apasiona el arte en general?").
pregunta_texto(disfruta_crear_cosas_nuevas, "Disfrutas crear cosas nuevas y unicas?").
pregunta_texto(gusta_pintar, "Te gusta pintar?").
pregunta_texto(gusta_dibujar, "Te gusta dibujar?").
pregunta_texto(gusta_esculpir, "Te gusta esculpir?").
pregunta_texto(gusta_explorar_medios_visuales, "Te gusta explorar medios visuales?").
pregunta_texto(gusta_comunicacion_visual, "Te gusta la comunicacion visual?").
pregunta_texto(gusta_tipografia, "Te gusta la tipografia?").
pregunta_texto(gusta_diseno_digital, "Te gusta el diseno digital?").
pregunta_texto(disfruta_tocar_instrumentos, "Disfrutas tocar instrumentos musicales?").
pregunta_texto(disfruta_componer_musica, "Disfrutas componer musica?").
pregunta_texto(disfruta_ensenar_musica, "Disfrutas ensenar musica?").
pregunta_texto(interes_contar_historias_audiovisuales, "Te interesa contar historias a traves del audiovisual?").
pregunta_texto(gusta_diseno_espacios, "Te gusta el diseno de espacios?").
pregunta_texto(gusta_planos, "Te gustan los planos?").
pregunta_texto(gusta_arte_funcionalidad, "Te gusta combinar arte con funcionalidad?").

% Preguntas para area Lenguas y Comunicacion
pregunta_texto(pasion_idiomas, "Te apasionan los idiomas?").
pregunta_texto(pasion_escritura, "Te apasiona la escritura?").
pregunta_texto(pasion_hablar_publico, "Te apasiona hablar en publico?").
pregunta_texto(interes_transmitir_ideas, "Te interesa transmitir ideas?").
pregunta_texto(interes_conectar_otros, "Te interesa conectar con los demas?").
pregunta_texto(eres_expresivo, "Eres una persona expresiva?").
pregunta_texto(eres_creativo, "Te consideras creativo?").
pregunta_texto(gusta_comunicarse, "Te gusta comunicarte con otros?").
pregunta_texto(interes_informar, "Te interesa informar?").
pregunta_texto(interes_investigar, "Te interesa investigar?").
pregunta_texto(interes_comunicar_noticias, "Te interesa comunicar noticias?").
pregunta_texto(gusta_persuadir, "Te gusta persuadir?").
pregunta_texto(gusta_crear_campanas, "Te gusta crear campanas?").
pregunta_texto(gusta_atraer_publico, "Te gusta atraer al publico?").
pregunta_texto(gusta_idiomas, "Te gustan los idiomas?").
pregunta_texto(interes_precision_lenguaje, "Te interesa la precision del lenguaje?").
pregunta_texto(disfruta_interactuar, "Disfrutas interactuar con personas?").
pregunta_texto(disfruta_organizar_eventos, "Disfrutas organizar eventos?").
pregunta_texto(disfruta_gestionar_imagen_publica, "Disfrutas gestionar la imagen publica?").
pregunta_texto(interes_television, "Te interesa la television?").
pregunta_texto(interes_radio, "Te interesa la radio?").
pregunta_texto(interes_medios_digitales, "Te interesan los medios digitales?").

% Preguntas para area Educacion y Pedagogia
pregunta_texto(gusta_ensenar, "Te gusta ensenar a otros?").
pregunta_texto(gusta_acompanar_aprendizaje, "Te gusta acompanar el proceso de aprendizaje de otros?").
pregunta_texto(gusta_compartir_conocimientos, "Te gusta compartir tus conocimientos?").
pregunta_texto(eres_paciente, "Te consideras una persona paciente?").
pregunta_texto(interes_trabajar_con_ninos_jovenes, "Te interesa trabajar con ninos o jovenes?").
pregunta_texto(querer_ensenar_ninos, "Quieres ensenar a ninos?").
pregunta_texto(formar_bases_educativas, "Te interesa formar las bases educativas de los ninos?").
pregunta_texto(interes_apoyar_necesidades_especiales, "Te interesa apoyar a personas con necesidades especiales?").
pregunta_texto(interes_entender_aprendizaje, "Te interesa entender como aprenden las personas?").
pregunta_texto(querer_ayudar_proceso_aprendizaje, "Quieres ayudar a las personas en su proceso de aprendizaje?").

% Preguntas para area Ciencias Naturales y Ambientales
pregunta_texto(interes_naturaleza, "Te interesa la naturaleza?").
pregunta_texto(interes_medio_ambiente, "Te interesa el medio ambiente?").
pregunta_texto(interes_fenomenos_fisicos, "Te interesan los fenomenos fisicos?").
pregunta_texto(pasion_investigar, "Te apasiona investigar?").
pregunta_texto(pasion_observar, "Te apasiona observar fenomenos naturales?").
pregunta_texto(pasion_experimentar, "Te apasiona experimentar?").
pregunta_texto(interes_vida, "Te interesa el estudio de la vida?").
pregunta_texto(interes_ecosistemas, "Te interesan los ecosistemas?").
pregunta_texto(interes_seres_vivos, "Te interesan los seres vivos?").
pregunta_texto(interes_sustancias, "Te interesan las sustancias y sus propiedades?").
pregunta_texto(interes_reacciones_quimicas, "Te interesan las reacciones quimicas?").
pregunta_texto(interes_investigacion_laboratorio, "Te interesa la investigacion de laboratorio?").
pregunta_texto(gusta_entender_funcionamiento_universo, "Te gusta entender como funciona el universo?").
pregunta_texto(preocupacion_medio_ambiente, "Te preocupa el medio ambiente?").
pregunta_texto(interes_sostenibilidad, "Te interesa la sostenibilidad?").
pregunta_texto(interes_rocas, "Te interesan las rocas y su formacion?").
pregunta_texto(interes_suelo, "Te interesa el estudio del suelo?").
pregunta_texto(interes_procesos_terrestres, "Te interesan los procesos terrestres?").

% Preguntas para area Turismo, Gastronomia y Servicios
pregunta_texto(interes_viajar, "Te interesa viajar?").
pregunta_texto(interes_atender_personas, "Te interesa atender personas?").
pregunta_texto(interes_crear_experiencias, "Te interesa crear experiencias memorables?").
pregunta_texto(gusta_cocina, "Te gusta la cocina?").
pregunta_texto(gusta_eventos, "Te gustan los eventos sociales?").
pregunta_texto(interes_mostrar_lugares, "Te interesa mostrar lugares interesantes?").
pregunta_texto(interes_planear_rutas, "Te interesa planear rutas de viaje?").
pregunta_texto(interes_conocer_culturas, "Te interesa conocer diferentes culturas?").
pregunta_texto(interes_atencion_cliente, "Te interesa la atencion al cliente?").
pregunta_texto(interes_organizacion_alojamientos, "Te interesa la organizacion de alojamientos?").
pregunta_texto(pasion_cocinar, "Te apasiona cocinar?").
pregunta_texto(gusta_crear_platos_nuevos, "Te gusta crear platos nuevos?").
pregunta_texto(gusta_coordinar, "Te gusta coordinar equipos?").
pregunta_texto(gusta_planificar, "Te gusta planificar actividades?").
pregunta_texto(gusta_organizar_actividades, "Te gusta organizar actividades?").
pregunta_texto(encanta_compartir_lugares, "Te encanta compartir conocimientos sobre lugares?").
pregunta_texto(encanta_compartir_culturas, "Te encanta compartir conocimientos sobre culturas?").

% Preguntas para area Ciencias del Deporte
pregunta_texto(disfruta_ejercicio, "Disfrutas hacer ejercicio regularmente?").
pregunta_texto(practica_deportes, "Practicas deportes con frecuencia?").
pregunta_texto(gusta_mantenerse_activo, "Te gusta mantenerte fisicamente activo?").
pregunta_texto(interes_rendimiento_fisico, "Te interesa el rendimiento fisico?").
pregunta_texto(interes_entrenamiento, "Te interesan los metodos de entrenamiento?").
pregunta_texto(querer_ensenar_deporte, "Quieres ensenar deportes a otros?").
pregunta_texto(querer_promover_habitos_saludables, "Quieres promover habitos saludables?").
pregunta_texto(querer_ayudar_rendimiento_fisico, "Quieres ayudar a otros a mejorar su rendimiento fisico?").
pregunta_texto(interes_tratar_lesiones_deportivas, "Te interesa tratar lesiones deportivas?").
pregunta_texto(interes_recuperar_atletas, "Te interesa la recuperacion de atletas?").
pregunta_texto(interes_movimiento_corporal, "Te interesa el estudio del movimiento corporal?").
pregunta_texto(interes_relacion_movimiento_salud, "Te interesa la relacion entre movimiento y salud?").

% Limpiar respuestas anteriores
limpiar_respuestas :-
    retract(si(_)), fail.
limpiar_respuestas :-
    retract(no(_)), fail.
limpiar_respuestas.