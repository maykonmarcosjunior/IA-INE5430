% sintomas
% Luzes do hardware não acendem
% placa não é reconhecida pelo SO
% Equipamento fora da rede
% Lentidão 
% problemas de comunicação
% Nenhuma luz de indicação no Switch 
% computadores não conectam à rede
% Impossibilidade de se conectar à rede Wi-Fi
% Impossibilidade de se conectar à rede interna
% impededimento a conexão
% Dificuldades de acesso a arquivos na rede	
% Programas não abrem
%  crasham logo após abrirem
sintoma(luzes_do_hardware_nao_acendem).
sintoma(placa_nao_reconhecida_pelo_so).
sintoma(equipamento_fora_da_rede).
sintoma(lentidao).
sintoma(problemas_de_comunicacao).
sintoma(nenhuma_luz_de_indicacao_no_switch).
sintoma(computadores_nao_conectam_a_rede).
sintoma(impossibilidade_de_se_conectar_a_rede_wifi).
sintoma(impossibilidade_de_se_conectar_a_rede_interna).
sintoma(impedimento_a_conexao).
sintoma(dificuldades_de_acesso_a_arquivos_na_rede).
sintoma(programas_nao_abrem).
sintoma(programas_crasham_logo_apos_abrirem).

%problemas
% Placa de rede com defeito ou queimada
% Cabo mal encaixado, oxidado ou com conector mal feito
% Cabo rompido ou danificado
% Switch queimado
% Problema de conexão à rede Wi-Fi
% Problemas de endereçamento
% Rede sem fio que não alcança um determinado local	
% Problemas de software
% Computador lento
% Falta de capacidade do PC
problema(placa_de_rede_com_defeito_ou_queimada).
problema(cabo_mal_encaixado).
problema(cabo_oxidado).
problema(cabo_danificado).
problema(switch_queimado).
problema(problema_de_conexao_a_rede_wifi).
problema(problemas_de_enderecamento).
problema(curto_alcance_de_rede).
problema(problemas_de_software).
problema(computador_lento).
problema(falta_de_capacidade_do_pc).

% soluções
% Substituir a placa de rede
% Verificar e substituir o conector, se necessário
% Substituir o cabo danificado
% Substituir o Switch
% Atualizar o computador e/ou verificar configurações de energia e/ou verificar compatibilidade com o roteador e/ou contatar o provedor de internet
% Renovar o endereço IP do dispositivo e/ou realizar ping para vencontrar o local da falha e/ou verificar quais aparelhos estão visíveis na rede
% Reposicionar o Access Point e/ou remover fontes de interferência
% Verificar as configurações do grupo de trabalho no sistema operacional
% Limpar programas desnecessários e/ou gerenciar o armazenamento e/ou contatar o provedor de internet
% Atualizar drivers e/ou adquirir hardware mais potente
solucao(substituir_a_placa_de_rede).
solucao(substituir_o_conector).
solucao(substituir_o_cabo).
solucao(substituir_o_switch).
solucao(atualizar_o_computador).
solucao(verificar_configuracoes_de_energia).
solucao(verificar_compatibilidade_com_o_roteador).
solucao(contatar_o_provedor_de_internet).
solucao(renovar_o_endereco_ip_do_dispositivo).
solucao(realizar_ping_para_encontrar_o_local_da_falha).
solucao(verificar_quais_aparelhos_estao_visiveis_na_rede).
solucao(reposicionar_o_access_point).
solucao(remover_fontes_de_interferencia).
solucao(verificar_as_configuracoes_do_grupo_de_trabalho_no_so).
solucao(limpar_programas_desnecessarios).
solucao(gerenciar_o_armazenamento).
solucao(atualizar_drivers).
solucao(adquirir_hardware_mais_potente).


% Problema: Placa de rede com defeito ou queimada
% Sintomas: Luzes do hardware não acendem ou a placa não é reconhecida pelo sistema operacional.
% Solução: Substituir a placa de rede.

% Problema: Cabo mal encaixado, oxidado ou com conector mal feito
% Sintomas: Equipamento fora da rede devido a mau encaixe ou contatos oxidados.
% Solução: Verificar e substituir o conector, se necessário.

% Problema: Cabo rompido ou danificado
% Sintomas: Lentidão ou problemas de comunicação.
% Solução: Substituir o cabo danificado.

% Problema: Switch queimado ou com porta queimada
% Sintomas: Nenhuma luz de indicação no Switch ou computadores não conectam à rede.
% Solução: Substituir o Switch.

% Problema: Problema de conexão à rede Wi-Fi
% Sintomas: Impossibilidade de se conectar à rede Wi-Fi.
% Soluções: Atualizar o computador, verificar configurações de energia, verificar compatibilidade com o roteador ou contatar o provedor de internet.

% Problema: Problemas de endereçamento:
% Sintomas: Impossibilidade de se conectar à rede interna
% Soluções: Renovar o endereço IP do dispositivo, realizar ping para verificar se o problema está na conexão com a internet ou com a rede interna, verificar quais aparelhos estão visíveis na rede

% Problema: Rede sem fio que não alcança um determinado local
% Sintomas: Interferências físicas ou eletromagnéticas impedem a conexão.
% Solução: Reposicionar o Access Point ou remover fontes de interferência.

% Problema: Problemas de software
% Sintomas: Dificuldades de acesso a arquivos na rede devido a configurações de software.
% Solução: Verificar as configurações do grupo de trabalho no sistema operacional.

% Problema: Computador lento
% Sintomas: Lentidão
% Soluções: Limpar programas desnecessários, gerenciar o armazenamento, ou consultar um profissional.

% Problema: Falta de capacidade do PC
% Sintomas: Programas não abrem ou crasham logo após.
% Soluções: Atualizar drivers ou adquirir hardware mais potente.

% associando sintomas aos seus respectivos problemas
% associa_sintoma_problema(sintoma, problema).
associa_sintoma_problema(luzes_do_hardware_nao_acendem, placa_de_rede_com_defeito_ou_queimada).
associa_sintoma_problema(placa_nao_reconhecida_pelo_so, placa_de_rede_com_defeito_ou_queimada).
associa_sintoma_problema(equipamento_fora_da_rede, cabo_mal_encaixado).
associa_sintoma_problema(equipamento_fora_da_rede, cabo_oxidado).
associa_sintoma_problema(lentidao, cabo_danificado).
associa_sintoma_problema(lentidao, computador_lento).
associa_sintoma_problema(problemas_de_comunicacao, cabo_danificado).
associa_sintoma_problema(nenhuma_luz_de_indicacao_no_switch, switch_queimado).
associa_sintoma_problema(computadores_nao_conectam_a_rede, switch_queimado).
associa_sintoma_problema(impossibilidade_de_se_conectar_a_rede_wifi, problema_de_conexao_a_rede_wifi).
associa_sintoma_problema(impossibilidade_de_se_conectar_a_rede_interna, problemas_de_enderecamento).
associa_sintoma_problema(impedimento_a_conexao, curto_alcance_de_rede).
associa_sintoma_problema(dificuldades_de_acesso_a_arquivos_na_rede, problemas_de_software).
associa_sintoma_problema(programas_nao_abrem, falta_de_capacidade_do_pc).
associa_sintoma_problema(programas_crasham_logo_apos_abrirem, falta_de_capacidade_do_pc).

% associando problemas às suas respectivas soluções
% associa_problema_solucao(problema, solucao).
associa_problema_solucao(placa_de_rede_com_defeito_ou_queimada, substituir_a_placa_de_rede).
associa_problema_solucao(cabo_mal_encaixado, substituir_o_conector).
associa_problema_solucao(cabo_oxidado, substituir_o_conector).
associa_problema_solucao(cabo_danificado, substituir_o_cabo).
associa_problema_solucao(switch_queimado, substituir_o_switch).
associa_problema_solucao(problema_de_conexao_a_rede_wifi, atualizar_o_computador).
associa_problema_solucao(problema_de_conexao_a_rede_wifi, verificar_configuracoes_de_energia).
associa_problema_solucao(problema_de_conexao_a_rede_wifi, verificar_compatibilidade_com_o_roteador).
associa_problema_solucao(problema_de_conexao_a_rede_wifi, contatar_o_provedor_de_internet).
associa_problema_solucao(problemas_de_enderecamento, renovar_o_endereco_ip_do_dispositivo).
associa_problema_solucao(problemas_de_enderecamento, realizar_ping_para_encontrar_o_local_da_falha).
associa_problema_solucao(problemas_de_enderecamento, verificar_quais_aparelhos_estao_visiveis_na_rede).
associa_problema_solucao(curto_alcance_de_rede, reposicionar_o_access_point).
associa_problema_solucao(curto_alcance_de_rede, remover_fontes_de_interferencia).
associa_problema_solucao(problemas_de_software, verificar_as_configuracoes_do_grupo_de_trabalho_no_so).
associa_problema_solucao(computador_lento, limpar_programas_desnecessarios).
associa_problema_solucao(computador_lento, gerenciar_o_armazenamento).
associa_problema_solucao(computador_lento, contatar_o_provedor_de_internet).
associa_problema_solucao(falta_de_capacidade_do_pc, atualizar_drivers).
associa_problema_solucao(falta_de_capacidade_do_pc, adquirir_hardware_mais_potente).

% diagnóstico baseado em múltiplos sintomas
diagnostico(Sintomas, Solucao) :-
    % para cada sintoma
    member(Sintoma, Sintomas),
    % para cada problema associado ao sintoma
    associa_sintoma_problema(Sintoma, Problema),
    % para cada solução associada ao problema
    associa_problema_solucao(Problema, Solucao).

main:-
        process,
        halt.

process:-
        %pergunta qual o sintoma, retorna o diagnóstico
        write('Qual o sintoma?'), nl,
        read(Sintoma),
        diagnostico([Sintoma], Solucao),
        write('Solução: '), write(Solucao), nl.
:- main.
