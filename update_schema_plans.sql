
-- Create table for Unit Models (Project Unit Types)
create table if not exists public.unit_models (
  id uuid default gen_random_uuid() primary key,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  project_id uuid references public.projects(id) on delete cascade not null,
  name text not null, -- e.g. "شمالية شرقية"
  description text,
  files jsonb not null default '[]'::jsonb -- Array of {url: string, type: 'image'|'pdf', path: string}
);

-- Enable RLS for unit_models
alter table public.unit_models enable row level security;

-- Drop policy if exists to avoid errors on re-run
drop policy if exists "Allow all access for unit_models" on public.unit_models;

-- Create policy
create policy "Allow all access for unit_models" on public.unit_models for all using (true) with check (true);

-- No change needed for project_documents, we will just use new types like 'project_plan'
