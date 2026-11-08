-- ============================================================
-- ENDORFIT · PROJETO PILOTO · BANCO DA PÁGINA "PRIMEIROS PASSOS"
-- Supabase da plataforma GeFit (projeto irwvagffrguiljaxrzmd), prefixo endorfit_
-- Academia: Endorfit · id 946bedd3-ff94-4dfa-a80d-51a4268dc9bc
--
-- Como rodar: SQL Editor do Supabase > colar tudo > ANTES de rodar, troque os
-- textos entre {{ }} no item 3 (nome, e-mail e senha) > Run.
-- Pode rodar de novo: só cria o que falta e não apaga dados.
-- Não toca em nenhuma tabela das outras academias.
-- ============================================================

create extension if not exists pgcrypto;

-- 1. Tabelas (mesmo padrão das outras academias; o Hub completo usa as mesmas)
create table if not exists endorfit_academias (id text primary key);
alter table endorfit_academias add column if not exists nome text;
alter table endorfit_academias add column if not exists cidade text;
alter table endorfit_academias add column if not exists ativo boolean default true;
alter table endorfit_academias add column if not exists created_at timestamptz default now();

create table if not exists endorfit_gestores (id text primary key);
alter table endorfit_gestores add column if not exists nome text;
alter table endorfit_gestores add column if not exists email text;
alter table endorfit_gestores add column if not exists senha_hash text;
alter table endorfit_gestores add column if not exists academia_id text;
alter table endorfit_gestores add column if not exists role text default 'gestor';
alter table endorfit_gestores add column if not exists ativo boolean default true;
alter table endorfit_gestores add column if not exists modulos_ativos text[] default '{}';
alter table endorfit_gestores add column if not exists created_at timestamptz default now();
create unique index if not exists endorfit_gestores_email_uidx on endorfit_gestores (lower(email));

-- Cadastro da academia preenchido pela gestora (uma linha por academia)
create table if not exists endorfit_onboarding (academia_id text primary key);
alter table endorfit_onboarding add column if not exists dados jsonb default '{}'::jsonb;
alter table endorfit_onboarding add column if not exists materiais jsonb default '{}'::jsonb;
alter table endorfit_onboarding add column if not exists enviado_em timestamptz;
alter table endorfit_onboarding add column if not exists atualizado_em timestamptz default now();

-- Reuniões (resumos) e tarefas combinadas
create table if not exists endorfit_reunioes (
  id uuid primary key default gen_random_uuid(),
  academia_id text not null,
  data date not null default current_date,
  titulo text,
  resumo text,
  created_at timestamptz default now()
);
create table if not exists endorfit_tarefas (
  id uuid primary key default gen_random_uuid(),
  academia_id text not null,
  reuniao_id uuid,
  titulo text not null,
  detalhe text,
  responsavel text default 'academia',
  prazo date,
  feita boolean default false,
  feita_em timestamptz,
  created_at timestamptz default now()
);
create index if not exists endorfit_reunioes_acad_idx on endorfit_reunioes (academia_id, data desc);
create index if not exists endorfit_tarefas_acad_idx on endorfit_tarefas (academia_id, feita, prazo);

-- Acesso: mesmo padrão das demais tabelas da plataforma (login atual não usa Supabase Auth)
do $$ declare r record; begin
  for r in select tablename from pg_tables where schemaname='public' and tablename like 'endorfit\_%' loop
    execute format('alter table public.%I disable row level security', r.tablename);
  end loop;
end $$;

-- 2. A academia
insert into endorfit_academias (id, nome, cidade)
values ('946bedd3-ff94-4dfa-a80d-51a4268dc9bc', 'Endorfit', '')
on conflict (id) do nothing;

-- 3. Logins: troque os textos entre {{ }} antes de rodar
--    A Neide (gestora) e você (admin GeFit: vê e lança reuniões e tarefas)
insert into endorfit_gestores (id, nome, email, senha_hash, academia_id, role, ativo, modulos_ativos)
values ('gest_endorfit_01', '{{NOME DA NEIDE}}', '{{EMAIL DA NEIDE}}', '{{SENHA DA NEIDE}}',
        '946bedd3-ff94-4dfa-a80d-51a4268dc9bc', 'gestor', true, array['inicio'])
on conflict (id) do nothing;
insert into endorfit_gestores (id, nome, email, senha_hash, academia_id, role, ativo, modulos_ativos)
values ('admin_endorfit_01', 'Nelson Rabelo', '{{SEU EMAIL}}', '{{SUA SENHA}}',
        '946bedd3-ff94-4dfa-a80d-51a4268dc9bc', 'admin', true, array['inicio'])
on conflict (id) do nothing;

-- Conferência: deve listar a academia e os 2 logins (sem senha)
select 'academia' as item, nome as valor from endorfit_academias
union all
select role, nome || ' <' || email || '>' from endorfit_gestores;
