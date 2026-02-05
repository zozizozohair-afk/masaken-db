
-- تحديث جدول المشاريع لإضافة الحقول الجديدة
alter table public.projects 
add column if not exists electricity_meters text[] default array[]::text[],
add column if not exists hoa_start_date date,
add column if not exists hoa_end_date date;

-- نقل البيانات القديمة (إذا وجدت) من العمود القديم إلى المصفوفة الجديدة
update public.projects 
set electricity_meters = array[electricity_meter] 
where electricity_meter is not null and electricity_meters = array[]::text[];

-- إنشاء جدول ملفات المشروع
create table if not exists public.project_documents (
  id uuid default gen_random_uuid() primary key,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null,
  project_id uuid references public.projects(id) on delete cascade not null,
  title text not null,
  type text not null, -- 'license', 'guarantee', 'occupancy', 'wafi', 'val', 'other'
  file_url text not null,
  file_path text not null -- path in storage bucket
);

-- تفعيل RLS لجدول الملفات
alter table public.project_documents enable row level security;
create policy "Allow all access" on public.project_documents for all using (true) with check (true);

-- ملاحظة: يجب إنشاء Storage Bucket باسم 'project-files' في لوحة تحكم Supabase
-- وإعداد سياسات الوصول (Storage Policies) لتكون Public أو Authenticated حسب الحاجة.
