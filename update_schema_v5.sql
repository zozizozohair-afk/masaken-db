-- تحديث جدول الوحدات لإضافة رقم هوية المفرغ له
alter table public.units 
add column if not exists title_deed_owner_id text; -- رقم هوية المفرغ له (المالك في الصك)
