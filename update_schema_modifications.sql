-- Add modifications_file_url column to units table
alter table public.units 
add column if not exists modifications_file_url text;
