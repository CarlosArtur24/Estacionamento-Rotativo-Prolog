:- dynamic obs/1.

% meta/1 devolve resultado(priority(P), alvo_minutos(Alvo), grupo(G))
meta(resultado(priority(P), alvo_minutos(Alvo), grupo(G))) :-
  categoria(Cat),
  prioridade(P),
  prazo_alvo(Cat, P, Alvo),
  grupo(Cat, G).

/* ===== Derivações ===== */

categoria(C) :- obs(categoria(C)).

% Impacto pelo numero de usuarios / veiculos afetados
impacto(alto)   :- obs(afetados(N)), N >= 100, !.
impacto(medio)  :- obs(afetados(N)), N >= 20,  !.
impacto(baixo).

% Urgencia por ocorrencia de fronteiras (seguranca), eventos, horario pico
urgencia(alta)  :- obs(seguranca(sim)), !.
urgencia(alta)  :- obs(evento(sim)), !.
urgencia(media) :- obs(horario_pico(sim)), !.
urgencia(baixa).

% Matriz impacto x urgencia -> prioridade
prioridade(p1) :- impacto(alto),  urgencia(alta), !.
prioridade(p2) :- (impacto(alto), urgencia(media));
                  (impacto(medio), urgencia(alta)), !.
prioridade(p3) :- impacto(medio), urgencia(media), !.
prioridade(p4) :- impacto(baixo); urgencia(baixa).

% Prazo alvo ajustado pela prioridade
prazo_alvo(Cat, P, AlvoMin) :-
  sla_base(Cat, Base),
  fator_prioridade(P, Fator),
  Temp is round(Base * Fator),
  ajuste_seguranca(Temp, AlvoMin).

fator_prioridade(p1, 0.25).
fator_prioridade(p2, 0.50).
fator_prioridade(p3, 1.00).
fator_prioridade(p4, 1.50).

% Se for incidente de seguranca, nao deixa prazo maior que 30 min
ajuste_seguranca(In, Out) :-
  ( obs(seguranca(sim)) ->
      Min is 30,
      (In > Min -> Out = Min ; Out = In)
  ; Out = In).

grupo(Cat, G) :- grupo_por_categoria(Cat, G).
