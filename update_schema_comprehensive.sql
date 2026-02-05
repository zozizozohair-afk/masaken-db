-- هذا الملف يجمع كافة التحديثات الأخيرة المطلوبة لقاعدة البيانات
-- يرجى نسخ هذا الكود وتشغيله في Supabase SQL Editor لإصلاح خطأ الحفظ

-- 1. إضافة رقم هوية المفرغ له (تحديث v5)
alter table public.units 
add column if not exists title_deed_owner_id text;

-- 2. إضافة رقم جوال المفرغ له (تحديث v6)
alter table public.units 
add column if not exists title_deed_owner_phone text;

-- 3. إضافة ملف محضر الفرز (تحديث v7)
alter table public.units 
add column if not exists sorting_record_file_url text;
