
-- تحديث جدول الوحدات لإضافة بيانات العملاء الإضافية
alter table public.units 
add column if not exists title_deed_owner text, -- اسم العميل المفرغ باسمه
add column if not exists client_id_number text, -- رقم الهوية
add column if not exists client_phone text; -- رقم الجوال
