# Endorfit · Projeto piloto (Metodologia GeFit)

Página "Primeiros passos" da Endorfit: a gestora preenche o cadastro da academia (empresa, responsável, redes e anúncios), envia os materiais para as pastas do Google Drive da Endorfit e acompanha os resumos das reuniões e as tarefas combinadas. O login `admin` (GeFit) lança as reuniões e tarefas e copia o cadastro preenchido.

- Academia: Endorfit · id `946bedd3-ff94-4dfa-a80d-51a4268dc9bc`
- Banco: Supabase da plataforma GeFit (`irwvagffrguiljaxrzmd`), tabelas com prefixo `endorfit_`
- `endorfit-inicio.sql` cria as tabelas, a academia e os dois logins (troque os textos entre `{{ }}` antes de rodar). Pode rodar de novo sem apagar dados.

Próximo passo: o Hub completo da Endorfit a partir da matriz, com as mesmas tabelas e o mesmo login.
