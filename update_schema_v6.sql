-- تحديث جدول الوحدات لإضافة رقم جوال المفرغ له
alter table public.units 
add column if not exists title_deed_owner_phone text; -- رقم جوال المفرغ له (المالك)
