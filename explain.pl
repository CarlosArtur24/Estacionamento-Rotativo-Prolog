explicar(resultado(priority(P), alvo_minutos(Alvo), grupo(G))) :-
  obs(categoria(Cat)),
  obs(afetados(N)),
  (obs(seguranca(S)); S=nao),
  (obs(evento(E)); E=nao),
  (obs(horario_pico(H)) -> true ; H = nao),

  ( (N >= 100 -> Imp=alto ; N >= 20 -> Imp=medio ; Imp=baixo) ),
  ( (S==sim ; E==sim) -> Urg=alta
    ; (H==sim) -> Urg=media
    ; Urg=baixa ),

  format("~n[Explicacao]~n"),
  format("- Categoria: ~w~n", [Cat]),
  format("- Afetados: ~w (~w)~n", [N, Imp]),
  format("- Seguranca: ~w | Evento: ~w | HorarioPico: ~w -> Urgencia: ~w~n",
         [S,E,H,Urg]),
  format("- Prioridade: ~w~n", [P]),
  format("- Grupo responsavel: ~w~n", [G]),
  format("- Prazo-alvo (min): ~w~n", [Alvo]).
