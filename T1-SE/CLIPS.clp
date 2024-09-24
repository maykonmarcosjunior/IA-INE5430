;; Definição dos sintomas
(deftemplate sintoma
   (slot nome))

(deftemplate problema
   (slot descricao))

(deftemplate solucao
   (slot nome))

;; Inicializa os fatos de sintomas, problemas e soluções
(defrule inicializar-fatos
    ?f <- (initial-fact)
=>
    (assert (sintoma (nome luzes_do_hardware_nao_acendem)))
    (assert (sintoma (nome placa_nao_reconhecida_pelo_so)))
    (assert (sintoma (nome equipamento_fora_da_rede)))
    (assert (sintoma (nome lentidao)))
    (assert (sintoma (nome problemas_de_comunicacao)))
    (assert (sintoma (nome nenhuma_luz_de_indicacao_no_switch)))
    (assert (sintoma (nome computadores_nao_conectam_a_rede)))
    (assert (sintoma (nome impossibilidade_de_se_conectar_a_rede_wifi)))
    (assert (sintoma (nome impossibilidade_de_se_conectar_a_rede_interna)))
    (assert (sintoma (nome impedimento_a_conexao)))
    (assert (sintoma (nome dificuldades_de_acesso_a_arquivos_na_rede)))
    (assert (sintoma (nome programas_nao_abrem)))
    (assert (sintoma (nome programas_crasham_logo_apos_abrirem)))
    
    (assert (problema (descricao placa_de_rede_com_defeito_ou_queimada)))
    (assert (problema (descricao cabo_oxidado)))
    (assert (problema (descricao cabo_danificado)))
    (assert (problema (descricao cabo_mal_encaixado)))
    (assert (problema (descricao switch_queimado)))
    (assert (problema (descricao problema_de_conexao_a_rede_wifi)))
    (assert (problema (descricao problemas_de_enderecamento)))
    (assert (problema (descricao curto_alcance_de_rede)))
    (assert (problema (descricao problemas_de_software)))
    (assert (problema (descricao computador_lento)))
    (assert (problema (descricao falta_de_capacidade_do_pc)))

    (assert (solucao (nome substituir_a_placa_de_rede)))
    (assert (solucao (nome substituir_o_conector)))
    (assert (solucao (nome substituir_o_cabo)))
    (assert (solucao (nome substituir_o_switch)))
    (assert (solucao (nome atualizar_o_computador)))
    (assert (solucao (nome alterar_configuracoes_de_energia)))
    (assert (solucao (nome verificar_compatibilidade_com_o_roteador)))
    (assert (solucao (nome contatar_o_provedor_de_internet)))
    (assert (solucao (nome renovar_o_endereco_ip_do_dispositivo)))
    (assert (solucao (nome realizar_ping_para_encontrar_o_local_da_falha)))
    (assert (solucao (nome verificar_quais_aparelhos_estao_visiveis_na_rede)))
    (assert (solucao (nome reposicionar_o_access_point)))
    (assert (solucao (nome remover_fontes_de_interferencia)))
    (assert (solucao (nome alterar_as_configuracoes_do_grupo_de_trabalho_no_so)))
    (assert (solucao (nome limpar_programas_desnecessarios)))
    (assert (solucao (nome gerenciar_o_armazenamento)))
    (assert (solucao (nome atualizar_drivers)))
    (assert (solucao (nome adquirir_hardware_mais_potente)))
    (retract ?f)
)


;; Listar sintomas e solicitar entrada do usuário
(defrule listar-sintomas
   ?f <- (initial-fact)
=>
   (printout t "Escolha um sintoma da lista abaixo, digitando exatamente o nome do sintoma:" crlf)
   (printout t "1. luzes_do_hardware_nao_acendem" crlf)
   (printout t "2. placa_nao_reconhecida_pelo_so" crlf)
   (printout t "3. equipamento_fora_da_rede" crlf)
   (printout t "4. lentidao" crlf)
   (printout t "5. problemas_de_comunicacao" crlf)
   (printout t "6. nenhuma_luz_de_indicacao_no_switch" crlf)
   (printout t "7. computadores_nao_conectam_a_rede" crlf)
   (printout t "8. impossibilidade_de_se_conectar_a_rede_wifi" crlf)
   (printout t "9. impossibilidade_de_se_conectar_a_rede_interna" crlf)
   (printout t "10. impedimento_a_conexao" crlf)
   (printout t "11. dificuldades_de_acesso_a_arquivos_na_rede" crlf)
   (printout t "12. programas_nao_abrem" crlf)
   (printout t "13. programas_crasham_logo_apos_abrirem" crlf)
   (printout t "Digite o sintoma: ")
   (bind ?input (read))
   (assert (sintoma (nome ?input)))
   (retract ?f)
)

;; Regras de associação de sintomas a problemas
;; Regras de associação de sintomas a problemas
(defrule sintomas-para-problemas
    ?s <- (sintoma (nome ?sintoma))
=>
    (if (eq ?sintoma luzes_do_hardware_nao_acendem)
        then (assert (problema (descricao placa_de_rede_com_defeito_ou_queimada))))

    (if (eq ?sintoma placa_nao_reconhecida_pelo_so)
        then (assert (problema (descricao placa_de_rede_com_defeito_ou_queimada))))

    (if (eq ?sintoma equipamento_fora_da_rede)
        then (assert (problema (descricao cabo_mal_encaixado)))
              (assert (problema (descricao cabo_oxidado))))
    
    (if (eq ?sintoma lentidao)
        then (assert (problema (descricao cabo_danificado)))
              (assert (problema (descricao computador_lento))))
    
    (if (eq ?sintoma problemas_de_comunicacao)
        then (assert (problema (descricao cabo_danificado))))
    
    (if (eq ?sintoma nenhuma_luz_de_indicacao_no_switch)
        then (assert (problema (descricao switch_queimado))))
    
    (if (eq ?sintoma computadores_nao_conectam_a_rede)
        then (assert (problema (descricao switch_queimado))))
    
    (if (eq ?sintoma impossibilidade_de_se_conectar_a_rede_wifi)
        then (assert (problema (descricao problema_de_conexao_a_rede_wifi))))
    
    (if (eq ?sintoma impossibilidade_de_se_conectar_a_rede_interna)
        then (assert (problema (descricao problemas_de_enderecamento))))
    
    (if (eq ?sintoma impedimento_a_conexao)
        then (assert (problema (descricao curto_alcance_de_rede))))
    
    (if (eq ?sintoma dificuldades_de_acesso_a_arquivos_na_rede)
        then (assert (problema (descricao problemas_de_software))))
    
    (if (eq ?sintoma programas_nao_abrem)
        then (assert (problema (descricao falta_de_capacidade_do_pc))))
    
    (if (eq ?sintoma programas_crasham_logo_apos_abrirem)
        then (assert (problema (descricao falta_de_capacidade_do_pc))))
)

;; Regras de associação de problemas a soluções
(defrule problemas-para-solucoes
    ?p <- (problema (descricao ?problema))
=>
    (if (eq ?problema placa_de_rede_com_defeito_ou_queimada)
        then (assert (solucao (nome substituir_a_placa_de_rede))))
    
    (if (eq ?problema cabo_mal_encaixado)
        then (assert (solucao (nome substituir_o_conector))))
    
    (if (eq ?problema cabo_oxidado)
        then (assert (solucao (nome substituir_o_conector))))
    
    (if (eq ?problema cabo_danificado)
        then (assert (solucao (nome substituir_o_cabo))))
    
    (if (eq ?problema switch_queimado)
        then (assert (solucao (nome substituir_o_switch))))
    
    (if (eq ?problema problema_de_conexao_a_rede_wifi)
        then (assert (solucao (nome atualizar_o_computador)))
              (assert (solucao (nome verificar_configuracoes_de_energia)))
              (assert (solucao (nome verificar_compatibilidade_com_o_roteador)))
              (assert (solucao (nome contatar_o_provedor_de_internet))))
    
    (if (eq ?problema problemas_de_enderecamento)
        then (assert (solucao (nome renovar_o_endereco_ip_do_dispositivo)))
              (assert (solucao (nome realizar_ping_para_encontrar_o_local_da_falha)))
              (assert (solucao (nome verificar_quais_aparelhos_estao_visiveis_na_rede))))
    
    (if (eq ?problema curto_alcance_de_rede)
        then (assert (solucao (nome reposicionar_o_access_point)))
              (assert (solucao (nome remover_fontes_de_interferencia))))
    
    (if (eq ?problema problemas_de_software)
        then (assert (solucao (nome verificar_as_configuracoes_do_grupo_de_trabalho_no_so))))
    
    (if (eq ?problema computador_lento)
        then (assert (solucao (nome limpar_programas_desnecessarios)))
              (assert (solucao (nome gerenciar_o_armazenamento)))
              (assert (solucao (nome contatar_o_provedor_de_internet))))
    
    (if (eq ?problema falta_de_capacidade_do_pc)
        then (assert (solucao (nome atualizar_drivers)))
              (assert (solucao (nome adquirir_hardware_mais_potente))))
)

;; Regra para imprimir soluções
(defrule imprimir-solucoes
   ?p <- (problema (descricao ?problema))
   ?s <- (solucao (nome ?solucao))
=>
    (printout t "Solução: " ?solucao crlf)
)
