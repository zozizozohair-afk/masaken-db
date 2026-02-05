-- Add notes column to units table
alter table public.units 
add column if not exists notes text;
