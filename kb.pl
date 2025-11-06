% Tempo base (em minutos) por tipo de problema no estacionamento
% Ex.: valores fictícios — ajuste se necessário
sla_base(boleto,         60).   % problema com boleto/retirada do ticket
sla_base(maquina,        30).   % problema na maquina de pagamento
sla_base(vaga,           120).  % falta vaga / evento / bloqueio
sla_base(seguranca,      20).   % incidente de segurança
sla_base(sistema,        45).   % falha no sistema de controle

% Grupo responsável por tipo
grupo_por_categoria(boleto,       caixa).
grupo_por_categoria(maquina,      manutencao).
grupo_por_categoria(vaga,         operacoes).
grupo_por_categoria(seguranca,    seguranca).
grupo_por_categoria(sistema,      ti).
