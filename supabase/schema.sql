-- =========================================================
--  Cocina del Sábado — tablas en Supabase
--  1. Cambia los dos correos de abajo por los de la familia.
--  2. Pega TODO este archivo en Supabase > SQL Editor > Run.
--  Se puede volver a correr sin problema.
-- =========================================================

-- Quiénes pueden ver y editar el plan de comidas.
-- Solo estos correos acceden; el resto del equipo del Tablero no ve nada.
create table if not exists cocina_familia (
  email text primary key
);

-- Datos de la app: 'cfg' (familia, metas, precios), 'buy' (lista marcada), 'prog' (pesajes).
create table if not exists cocina_docs (
  key text primary key,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz default now(),
  updated_by text
);

create or replace function cocina_es_familia() returns boolean
language sql stable security definer set search_path = public as $$
  select exists (select 1 from cocina_familia where lower(email) = lower(auth.jwt() ->> 'email'));
$$;

alter table cocina_familia enable row level security;
alter table cocina_docs    enable row level security;

drop policy if exists "cocina_familia_leer" on cocina_familia;
create policy "cocina_familia_leer" on cocina_familia for select to authenticated
  using (lower(email) = lower(auth.jwt() ->> 'email'));

drop policy if exists "cocina_docs_familia" on cocina_docs;
create policy "cocina_docs_familia" on cocina_docs for all to authenticated
  using (cocina_es_familia()) with check (cocina_es_familia());

-- Cambios en vivo entre celulares
do $$ begin
  alter publication supabase_realtime add table cocina_docs;
exception when duplicate_object then null; end $$;

-- 👇 CAMBIA ESTOS CORREOS por el tuyo y el de tu esposo
insert into cocina_familia (email) values
  ('valentinaescobar@utp.edu.co'),
  ('eng.otalvaro@gmail.com')
on conflict do nothing;
