-- هذا الملف يقوم بإصلاح مشكلة حفظ حالات الوحدة الجديدة
-- المشكلة: وجود قيد (Check Constraint) في قاعدة البيانات يمنع حفظ قيم مثل "تحت الإنشاء" أو "إعادة بيع"
-- الحل: حذف القيد القديم وإضافة قيد جديد يشمل جميع الحالات المطلوبة

-- 1. محاولة حذف القيد القديم (قد يكون اسمه units_status_check أو اسم تلقائي)
-- ملاحظة: إذا لم يعمل الحذف بالاسم، سنحاول تحديث العمود ليكون مرناً

DO $$ 
DECLARE 
    r RECORD;
BEGIN 
    -- البحث عن قيود التحقق على عمود status في جدول units وحذفها
    FOR r IN (
        SELECT constraint_name 
        FROM information_schema.constraint_column_usage 
        WHERE table_name = 'units' AND column_name = 'status'
    ) LOOP 
        EXECUTE 'ALTER TABLE public.units DROP CONSTRAINT ' || quote_ident(r.constraint_name); 
    END LOOP; 
END $$;

-- 2. (اختياري) إضافة قيد جديد يشمل الحالات الجديدة
-- إذا كنت تفضل عدم وجود قيود لتسهيل التعديلات المستقبلية، يمكنك تجاهل هذا الجزء
-- ولكن للحفاظ على سلامة البيانات، يفضل تفعيله

ALTER TABLE public.units ADD CONSTRAINT units_status_check 
CHECK (status IN (
  'available', 
  'sold', 
  'rented', 
  'for_resale', 
  'under_construction', 
  'deed_completed', 
  'resold', 
  'transferred_to_other'
));
