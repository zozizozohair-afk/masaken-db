-- جدول المشاريع
create table public.projects (
  id uuid default gen_random_uuid() primary key,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  name text not null,
  project_number text,
  deed_number text,
  orientation text, -- North, South, East, West
  floors_count integer default 1,
  units_per_floor integer default 4,
  has_annex boolean default false,
  annex_count integer default 0,
  water_meter text,
  electricity_meter text,
  status text default 'active'
);

-- جدول الوحدات
create table public.units (
  id uuid default gen_random_uuid() primary key,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  project_id uuid references public.projects(id) on delete cascade not null,
  unit_number integer not null,
  floor_number integer not null,
  floor_label text,
  direction_label text,
  type text check (type in ('apartment', 'annex')),
  electricity_meter text,
  water_meter text,
  client_name text,
  deed_number text, -- رقم صك الوحدة (إن وجد)
  status text default 'available' -- available, sold, rented
);

-- تفعيل RLS (Row Level Security) - اختياري حالياً لسهولة التطوير
alter table public.projects enable row level security;
alter table public.units enable row level security;

-- سياسة للسماح للجميع بالقراءة والكتابة (لأغراض التطوير فقط)
-- يفضل تغييرها لاحقاً لتسمح فقط للمستخدمين المسجلين
create policy "Allow all access" on public.projects for all using (true) with check (true);
create policy "Allow all access" on public.units for all using (true) with check (true);
