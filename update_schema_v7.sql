-- تحديث جدول الوحدات لإضافة ملف محضر الفرز
alter table public.units 
add column if not exists sorting_record_file_url text; -- رابط ملف محضر الفرز (PDF)
