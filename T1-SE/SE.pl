%problemas
% Falta de Conexão	Conexão Lenta	Queda Frequente	Curto Alcance	Velocidade Inconsistente	Falhas no Roteador ou Modem	Configuração Incorreta	Conflito de IP	Dispositivos Não se Comunicam	Falhas nos Cabos de Rede	Interrupção no Serviço	Problemas de DNS do ISP	Rede comprometida ou ataques (DDoS, etc.)	Firewall Bloqueando Tráfego	Configuração de Proxy Incorreta	Drivers de Rede Desatualizados
problema(falta_de_conexao).
problema(conexao_lenta).
problema(quedas_frequentes).
problema(curto_alcance).
problema(velocidade_inconsistente).
problema(falhas_no_roteador_ou_modem).
problema(configuracao_incorreta).
problema(conflito_de_ip).
problema(dispositivos_nao_se_comunicam).
problema(falhas_nos_cabos_de_rede).
problema(interrupcao_no_servico).
problema(problemas_de_dns_do_isp).
problema(rede_comprometida_ou_ataques).
problema(firewall_bloqueando_trafego).
problema(configuracao_de_proxy_incorreta).
problema(drivers_de_rede_desatualizados).

% sintomas
% Nenhum acesso a sites.	Downloads demorados.	Desconexão frequente de dispositivos sem fio.	Conexão apenas próxima ao roteador.	Flutuações na velocidade de download/upload.	LED de erro ou falha no equipamento.	Acesso Limitado à internet.	Mensagem de "Conflito de IP".	Impressoras ou outros dispositivos de rede inacessíveis.	Conexão intermitente ou sem conexão.	Nenhuma conexão com a internet apesar do equipamento estar funcionando.	Navegação lenta ou sites inacessíveis.	Lentidão inexplicável.	Navegação limitada ou sem acesso a alguns sites.	Conexão limitada ou sem acesso à internet.	Desconexões frequentes ou nenhuma conexão.
% Ícone de Wi-Fi ou Cabo Desconectado.	Vídeos com buffering.	Necessidade de reconectar manualmente.			Equipamento não liga.	Dispositivos conectam, mas sem navegação.	Nenhuma conexão à internet em alguns dispositivos.					Dispositivos desconhecidos na rede.			
% Mensagem "Sem Internet".	Ping alto em jogos online.														

% associando sintomas aos seus respectivos problemas

sintoma(dificuldade_no_acesso_a_sites).
sintoma(downloads_demorados).
sintoma(desconexao_frequente).
sintoma(desconectar_longe_do_roteador).
sintoma(flutuacoes_na_velocidade).
sintoma(led_de_erro_ou_falha).
sintoma(acesso_limitado_a_internet).
%sintoma(conflito_de_ip).
sintoma(dispositivos_inacessiveis).
sintoma(conexao_intermitente).
sintoma(sem_conexao).
sintoma(lentidao).
sintoma(navegacao_limitada).
sintoma(icone_de_wifi_desconectado).
sintoma(icone_de_cabo_desconectado).
sintoma(videos_com_buffering).
sintoma(precisa_reconectar_manualmente).
sintoma(equipamento_nao_liga).
sintoma(conexao_sem_navegacao).
sintoma(sem_conexao_em_alguns_dispositivos).
sintoma(dispositivos_desconhecidos_na_rede).
sintoma(mensagem_sem_internet).
sintoma(ping_alto).

% causas
% Cabos desconectados.	Largura de banda insuficiente.	Interferência de outros aparelhos (micro-ondas, telefones sem fio).	Paredes grossas ou objetos metálicos entre o roteador e dispositivos.	Interferência de sinal.	Fonte de alimentação com defeito.	Configuração manual errada (p. ex.: IP estático incorreto).	Múltiplos dispositivos com o mesmo IP.	Firewall ou antivírus bloqueando a comunicação.	Cabos danificados ou mal encaixados.	Manutenção ou falhas no provedor.	DNS do provedor sobrecarregado ou com falhas.	Senha de Wi-Fi fraca.	Configurações agressivas de firewall.	Proxy mal configurado ou desnecessário.	Incompatibilidade com hardware ou software recente.
% Configuração de rede incorreta.	Interferências na rede Wi-Fi.	Overlap de canais com redes vizinhas.	Roteador com potência limitada.	Distância do roteador.	Falha de hardware.	Configuração incorreta de DNS.		Configurações de rede privada/pública incorretas.				Falta de criptografia adequada (WPA2/WPA3).			
% Interrupção no provedor de serviços (ISP).	Múltiplos dispositivos conectados.	Roteador mal posicionado ou obstruído.		Sobrecarga da rede (muitos dispositivos conectados).											
% Equipamento antigo ou sobrecarregado														

causa(cabos_desconectados).
causa(cabos_danificados).
causa(largura_de_banda_insuficiente).
causa(interferencia_de_outros_aparelhos).
causa(paredes_grossas).
causa(fonte_de_alimentacao_com_defeito).
causa(erro_de_configuracao_de_rede).
causa(ip_repetido).
causa(configuracoes_de_firewall).
causa(antivirus).
causa(falha_no_provedor).
causa(dns_sobrecarregado).
causa(senha_de_wifi_fraca).
causa(proxy_mal_configurado).
causa(incompatibilidade_com_hardware).
causa(interferencias_na_rede_wifi).
causa(overlap_de_canais).
causa(roteador_fraco).
causa(distancia_do_roteador).
causa(falha_de_hardware).
causa(configuracao_incorreta_de_dns).
causa(configuracoes_de_rede_privada_publica).
causa(falta_de_criptografia).
causa(interrupcao_no_provedor).
causa(muitos_dispositivos_conectados).
causa(roteador_mal_posicionado).
causa(equipamento_antigo).


diagnostico(dificuldade_no_acesso_a_sites, falta_de_conexao).
diagnostico(downloads_demorados, conexao_lenta).
diagnostico(desconexao_frequente, quedas_frequentes).
diagnostico(desconectar_longe_do_roteador, curto_alcance).
diagnostico(flutuacoes_na_velocidade, velocidade_inconsistente).
diagnostico(led_de_erro_ou_falha, falhas_no_roteador_ou_modem).
diagnostico(acesso_limitado_a_internet, configuracao_incorreta).
diagnostico(dispositivos_inacessiveis, dispositivos_nao_se_comunicam).
diagnostico(conexao_intermitente, falhas_nos_cabos_de_rede).
diagnostico(sem_conexao, falhas_nos_cabos_de_rede).
diagnostico(lentidao, rede_comprometida_ou_ataques).
diagnostico(navegacao_limitada, configuracao_incorreta).
diagnostico(icone_de_wifi_desconectado, falta_de_conexao).
diagnostico(icone_de_cabo_desconectado, falta_de_conexao).
diagnostico(videos_com_buffering, conexao_lenta).
diagnostico(precisa_reconectar_manualmente, quedas_frequentes).
diagnostico(equipamento_nao_liga, falhas_no_roteador_ou_modem).
diagnostico(conexao_sem_navegacao, configuracao_incorreta).
diagnostico(sem_conexao_em_alguns_dispositivos, conflito_de_ip).
diagnostico(dispositivos_desconhecidos_na_rede, rede_comprometida_ou_ataques).
diagnostico(mensagem_sem_internet, falta_de_conexao).
%diagnostico(ping_alto).


%diagnostico(sintoma, X).



