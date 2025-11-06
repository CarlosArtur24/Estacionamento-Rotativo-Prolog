:- dynamic obs/1.

pergunta(Campo, Texto) :-
    format("~w ", [Texto]),
    read(Ans0),
    downcase_atom(Ans0, Ans),
    ( Ans == s ->
        Term =.. [Campo, sim],
        assertz(obs(Term))
    ; Ans == n ->
        Term =.. [Campo, nao],
        assertz(obs(Term))
    ; format("Entrada invalida. Digite s ou n.~n"),
      pergunta(Campo, Texto)
    ).

coletar_observacoes :-
    format("Categoria (boleto/maquina/vaga/seguranca/sistema): "),
    read(Cat),
    assertz(obs(categoria(Cat))),

    format("Veiculos/usuarios afetados (numero inteiro): "),
    read(N),
    assertz(obs(afetados(N))),

    pergunta(seguranca, "Incidente de seguranca? (s/n)"),
    pergunta(evento, "Evento (evento programado que aumenta demanda)? (s/n)"),
    pergunta(horario_pico, "Dentro do horario pico? (s/n)").

cleanup :- retractall(obs(_)).
