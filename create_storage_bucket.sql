-- إنشاء حاوية التخزين (Storage Bucket) باسم 'project-files'
insert into storage.buckets (id, name, public)
values ('project-files', 'project-files', true)
on conflict (id) do nothing;

-- إعداد سياسات الأمان (RLS) للسماح برفع وقراءة الملفات
-- تنبيه: هذه السياسات عامة لأغراض التطوير. يفضل تخصيصها لاحقاً.

-- 1. السماح للجميع بقراءة الملفات (Public Read)
create policy "Public Read Access"
on storage.objects for select
using ( bucket_id = 'project-files' );

-- 2. السماح برفع الملفات (Upload)
create policy "Allow Uploads"
on storage.objects for insert
with check ( bucket_id = 'project-files' );

-- 3. السماح بتحديث الملفات (Update)
create policy "Allow Updates"
on storage.objects for update
using ( bucket_id = 'project-files' );

-- 4. السماح بحذف الملفات (Delete)
create policy "Allow Deletes"
on storage.objects for delete
using ( bucket_id = 'project-files' );
