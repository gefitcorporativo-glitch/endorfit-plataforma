# Briefing: plataforma da Endorfit

**Dono:** Nelson Rabelo (GeFit) · **Montada em:** 09/11/2026, a partir da matriz `plataforma` (commit `ca9590d`)

## Regras
1. Mostrar o plano e o visual antes de construir. Publicar só com o "pode publicar".
2. A matriz é a fonte da verdade. Atualizações vêm da matriz, nunca de outro cliente.
3. GeFit só no rodapé "Metodologia" + logo.
4. Português do Brasil, frases curtas, sem travessões. "Experiência", nunca "aula experimental".
5. Nunca colocar chave secreta em arquivo e nunca desligar o RLS da Retenção.

## Dados
| Item | Valor |
|---|---|
| Academia | Endorfit (Studio Neide Rios, Mairi BA) |
| ID | `946bedd3-ff94-4dfa-a80d-51a4268dc9bc` |
| Prefixo | `endorfit_` |
| Banco | Supabase da plataforma GeFit `irwvagffrguiljaxrzmd` |
| Retenção | `NOME_MARCA` "Endorfit Retenção", `STORAGE_KEY` "ret-endorfit", `MARCA_CHAVE` "endorfit" |
| Cores | Verde `#48D9B5`, cinza `#4E4D4D`, branco; verde para texto `#137A64` |
| Fonte | Titillium Web |
| Logos | `logo-endorfit.png` (verde, fundo escuro), `logo-endorfit-claro.png` (verde e cinza, fundo claro), `icone-endorfit.png` |
| Modalidades | Funcional feminino e musculação wellness. Sem piscina, sem natação, sem lutas (a confirmar com o Nelson) |
| Presente da Experiência | Texto padrão da matriz até a confirmação |

## Como foi gerada
A pasta `build/` do chat NR | ENDORFIT tem o script que copia a matriz e aplica as trocas: identidade, ID, prefixo, `MODO_MESTRE=false`, fim dos espaços do admin, aba Marketing e ligação com o portal Primeiros passos.

## Diferenças em relação à matriz
- O Hub da matriz (`index.html`) aqui se chama `hub.html`, porque o `index.html` é o portal Primeiros passos.
- Aba 📣 Marketing (Briefing e campanhas, Estúdio, Tráfego pago). Ainda não existe na matriz.
- Mapa do Hub com prints da Endorfit e o módulo Marketing.
- Hub de Pessoas: o quadro de login não aparece mais junto com o painel (`[hidden]` com `!important`). Candidato a ir para a matriz.
