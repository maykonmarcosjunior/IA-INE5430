;; Definição dos sintomas
(deftemplate sintoma
   (slot nome))

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

;; Definição dos problemas
(deftemplate problema
   (slot descricao))

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

;; Definição das soluções
(deftemplate solucao
   (slot nome))

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

;; Problema: Placa de rede com defeito ou queimada
(defrule diagnosticar-placa-rede-queimada
    (or (sintoma (nome luzes_do_hardware_nao_acendem))
        (sintoma (nome placa_nao_reconhecida_pelo_so)))
=>
    (assert (problema (descricao placa_de_rede_com_defeito_ou_queimada)))
    (assert (solucao (nome substituir_a_placa_de_rede)))
    (printout t "Diagnóstico: Placa de rede com defeito ou queimada." crlf
              "Solução: Substituir a placa de rede." crlf))

;; Problema: Cabo mal encaixado, oxidado ou com conector mal feito
(defrule diagnosticar-cabo-mal-encaixado
    (sintoma (nome equipamento_fora_da_rede))
=>
    (assert (or (problema (descricao cabo_mal_encaixado))
                (problema (descricao cabo_oxidado))))
    (assert (solucao (nome substituir_o_conector)))
    (printout t "Diagnóstico: Cabo mal encaixado, oxidado ou com conector mal feito." crlf
              "Solução: Verificar e substituir o conector." crlf))

;; Problema: Cabo danificado
(defrule diagnosticar-cabo-danificado
    (or (sintoma (nome lentidao))
        (sintoma (nome problemas_de_comunicacao)))
=>
    (assert (problema (descricao cabo_danificado)))
    (assert (solucao (nome substituir_o_cabo)))
    (printout t "Diagnóstico: Cabo rompido ou danificado." crlf
              "Solução: Substituir o cabo." crlf))

;; Problema: Switch queimado ou com porta queimada
(defrule diagnosticar-switch-queimado
    (or (sintoma (nome nenhuma_luz_de_indicacao_no_switch))
        (sintoma (nome computadores_nao_conectam_a_rede)))
=>
    (assert (problema (descricao switch_queimado)))
    (assert (solucao (nome substituir_o_switch)))
    (printout t "Diagnóstico: Switch queimado ou com porta queimada." crlf
              "Solução: Substituir o Switch." crlf))

;; Problema: Problema de conexão à rede Wi-Fi
(defrule diagnosticar-problema-wifi
    (sintoma (nome impossibilidade_de_se_conectar_a_rede_wifi))
=>
    (assert (problema (descricao problema_de_conexao_a_rede_wifi)))
    (assert (or (solucao (nome atualizar_o_computador))
                (solucao (nome alterar_configuracoes_de_energia))
                (solucao (nome verificar_compatibilidade_com_o_roteador))
                (solucao (nome contatar_o_provedor_de_internet))))
    (printout t "Diagnóstico: Problema de conexão à rede Wi-Fi." crlf
              "Possíveis soluções: Atualizar o computador, verificar configurações de energia, verificar compatibilidade com o roteador, contatar o provedor de internet." crlf))

;; Problema: Problemas de endereçamento
(defrule diagnosticar-problema-enderecamento
    (sintoma (nome impossibilidade_de_se_conectar_a_rede_interna))
=>
    (assert (problema (descricao problemas_de_enderecamento)))
    (assert (or (solucao (nome renovar_o_endereco_ip_do_dispositivo))
                (solucao (nome realizar_ping_para_encontrar_o_local_da_falha))
                (solucao (nome verificar_quais_aparelhos_estao_visiveis_na_rede))))
    (printout t "Diagnóstico: Problemas de endereçamento." crlf
              "Possíveis soluções: Renovar o endereço IP, realizar ping, verificar aparelhos visíveis na rede." crlf))

;; Problema: Rede sem fio que não alcança um determinado local
(defrule diagnosticar-curto-alcance-de-rede
    (sintoma (nome impedimento_a_conexao))
=>
    (assert (problema (descricao curto_alcance_de_rede)))
    (assert (or (solucao (nome reposicionar_o_access_point))
                (solucao (nome remover_fontes_de_interferencia))))
    (printout t "Diagnóstico: Rede sem fio que não alcança um determinado local." crlf
              "Possíveis soluções: Reposicionar o Access Point, remover fontes de interferência." crlf))

;; Problema: Problemas de software
(defrule diagnosticar-problemas-software
    (sintoma (nome dificuldades_de_acesso_a_arquivos_na_rede))
=>
    (assert (problema (descricao problemas_de_software)))
    (assert (solucao (nome alterar_as_configuracoes_do_grupo_de_trabalho_no_so)))
    (printout t "Diagnóstico: Problemas de software." crlf
              "Solução: Verificar as configurações do grupo de trabalho no sistema operacional." crlf))

;; Problema: Computador lento
(defrule diagnosticar-computador-lento
    (sintoma (nome lentidao))
=>
    (assert (problema (descricao computador_lento)))
    (assert (or (solucao (nome limpar_programas_desnecessarios))
                (solucao (nome gerenciar_o_armazenamento))
                (solucao (nome atualizar_drivers))))
    (printout t "Diagnóstico: Computador lento." crlf
              "Possíveis soluções: Limpar programas desnecessários, gerenciar armazenamento, atualizar drivers." crlf))

;; Problema: Falta de capacidade do PC
(defrule diagnosticar-falta-de-capacidade
    (or (sintoma (nome programas_nao_abrem))
        (sintoma (nome programas_crasham_logo_apos_abrirem)))
=>
    (assert (problema (descricao falta_de_capacidade_do_pc)))
    (assert (or (solucao (nome atualizar_drivers))
                (solucao (nome adquirir_hardware_mais_potente))))
    (printout t "Diagnóstico: Falta de capacidade do PC." crlf
              "Possíveis soluções: Atualizar drivers, adquirir hardware mais potente." crlf))
