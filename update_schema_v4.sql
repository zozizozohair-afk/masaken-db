-- تحديث جدول الوحدات لإضافة رابط ملف الصك
alter table public.units 
add column if not exists deed_file_url text; -- رابط ملف الصك (PDF)
