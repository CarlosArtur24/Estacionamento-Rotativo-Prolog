# 🅿️ Sistema Especialista — Estacionamento Rotativo

---

## 🎯 Objetivo

Desenvolver um **sistema especialista** em **Prolog** para apoiar o atendimento de ocorrências em um **estacionamento rotativo**, classificando incidentes, determinando prioridade, grupo responsável e prazo de resolução (SLA).

O sistema pergunta informações sobre o incidente, avalia regras de impacto e urgência e retorna uma recomendação explicada.

---

## 🧩 Estrutura do projeto

estacionamento_rotativo/
│
├── src/
│ ├── main.pl # Arquivo principal (menu e controle)
│ ├── kb.pl # Base de conhecimento (fatos)
│ ├── rules.pl # Regras de inferência
│ ├── ui.pl # Interface de perguntas (entrada de dados)
│ └── explain.pl # Geração de explicação detalhada
│
├── e2e_estacionamento.html # Evidência do roteiro E2E
└── demo_estacionamento.html # Simulação interativa no navegador

yaml
Copiar código

---

## ⚙️ Requisitos

- **SWI-Prolog** (https://www.swi-prolog.org/)
- Editor de texto (recomendado: **Visual Studio Code**)
- Navegador (para abrir os arquivos `.html`)

---

## 🚀 Como executar o sistema (Prolog)

1. Abra o terminal na pasta do projeto:
   ```bash
   cd caminho/para/estacionamento_rotativo
Inicie o SWI-Prolog:

bash
Copiar código
swipl
Carregue o sistema:

prolog
Copiar código
?- ['src/main.pl'].
Inicie o menu:

prolog
Copiar código
?- start.
Siga as instruções na tela, respondendo:

Categoria do problema (ex: maquina)

Número de veículos afetados

Se é incidente de segurança, evento ou horário de pico
O sistema exibirá o resultado e a explicação da inferência.

📖 Exemplo de execução
Entrada (no Prolog):

makefile
Copiar código
Categoria: maquina
Afetados: 40
Seguranca? n
Evento? s
Horario pico? s
Saída esperada:

yaml
Copiar código
[Explicacao]
- Categoria: maquina
- Afetados: 40 (medio)
- Seguranca: nao | Evento: sim | HorarioPico: sim -> Urgencia: alta
- Prioridade: p2
- Grupo responsavel: manutencao
- Prazo-alvo (min): 15

RESULTADO: resultado(priority(p2), alvo_minutos(15), grupo(manutencao))
🌐 Arquivos HTML
🔹 e2e_estacionamento.html
Roteiro E2E (End to End) com contexto, passo a passo, prints e conclusão.
Abra no navegador para visualizar o relatório completo.

🔹 demo_estacionamento.html
Simulação interativa da lógica do sistema (versão visual).
Permite selecionar parâmetros e ver o resultado da regra diretamente no navegador, sem precisar abrir o Prolog.

🧠 Lógica resumida
Regra	Descrição
impacto/1	Define o impacto (baixo/médio/alto) conforme nº de veículos afetados
urgencia/1	Define urgência (baixa/média/alta) conforme evento, segurança ou pico
prioridade/1	Determina prioridade p1–p4 a partir da matriz impacto × urgência
prazo_alvo/3	Calcula prazo (em minutos) aplicando fator à base do tipo de incidente
grupo/2	Define o grupo responsável pela categoria
explicar/1	Exibe toda a lógica usada para gerar o resultado

🧪 Evidência E2E
O arquivo e2e_estacionamento.html contém:

Contexto de cenário (1 parágrafo)

Passos executados no Prolog

Saída esperada

Análise de resultado

Conclusão do teste

👨‍💻 Autor
Nome: Carlos Artur Ceola
