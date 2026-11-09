# Plataforma Endorfit

Plataforma comercial, de marketing e de retenção da Endorfit, com Metodologia GeFit.
Montada a partir da matriz `gefitcorporativo-glitch/plataforma` (branch `main`, commit `ca9590d`), igual em funcionamento à Academia Modelo.

- Academia: Endorfit · id `946bedd3-ff94-4dfa-a80d-51a4268dc9bc`
- Banco: Supabase da plataforma GeFit (`irwvagffrguiljaxrzmd`), tabelas com prefixo `endorfit_`
- Retenção (`retencao/`): Supabase compartilhado do Planner Digital (`xpvedihpejivnkssryhc`), acessos criados no Painel Admin da Retenção. `MARCA_CHAVE` = `endorfit`
- Identidade (manual de marca): verde `#48D9B5`, cinza `#4E4D4D`, branco. Verde para texto em fundo claro `#137A64`. Fonte Titillium Web

## Links
- Primeiros passos (portal da gestora): https://gefitcorporativo-glitch.github.io/endorfit-plataforma/
- Hub: https://gefitcorporativo-glitch.github.io/endorfit-plataforma/hub.html
- Mapa do Hub: https://gefitcorporativo-glitch.github.io/endorfit-plataforma/mapa-ferramenta.html
- NPS do aluno: https://gefitcorporativo-glitch.github.io/endorfit-plataforma/nps.html?a=946bedd3-ff94-4dfa-a80d-51a4268dc9bc
- Teste do candidato: https://gefitcorporativo-glitch.github.io/endorfit-plataforma/teste-candidato.html?a=946bedd3-ff94-4dfa-a80d-51a4268dc9bc

## Portal e Hub
- `index.html` é o portal **Primeiros passos** (cadastro, materiais, reuniões e tarefas). O link, o login e as respostas continuam iguais.
- `hub.html` é o Hub completo da matriz. Usa a mesma tabela `endorfit_gestores`: o mesmo e-mail e a mesma senha valem nos dois.
- Quem entrou no portal abre o Hub direto, na mesma aba, e o Hub tem o botão **📋 Primeiros passos** para voltar.
- No portal, o botão **Abrir o Hub** aparece só para o admin, por enquanto.

## Área de Marketing
Aba **📣 Marketing** no menu lateral do Hub: Briefing e campanhas, Estúdio e Tráfego pago.
O botão **Gravações pendentes** abre `https://studio.gefithub.com.br/a/endorfit` em nova aba e fica desligado até a rota ser validada.
Para ligar: em `hub.html`, trocar `const ESTUDIO_ATIVO = false;` por `true`.
**Vídeos entregues** aparece como "em breve" até a galeria existir. A Biblioteca de gestão continua no computador do Nelson.

## Banco
`endorfit-schema-completo.sql` cria todas as tabelas `endorfit_` do Hub e só acrescenta colunas às que já existem (pode rodar de novo sem apagar dados).
Ele não cria logins: a gestora e o admin já existem desde o `endorfit-inicio.sql` e só ganham os módulos do Hub.

## Fora desta instalação
Tudo do espaço GeFit | Painel Gestão (scripts e cadência do Oliver, `ferramentas-gefit.js`, Biblioteca de Conteúdo, troca de espaços do admin), os hubs antigos da GeFit, as opções de piscina e natação e as de lutas.
