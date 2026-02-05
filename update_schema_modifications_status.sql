-- Add modification status columns to units table
ALTER TABLE units
ADD COLUMN IF NOT EXISTS modification_client_confirmed BOOLEAN DEFAULT FALSE,
ADD COLUMN IF NOT EXISTS modification_engineer_reviewed BOOLEAN DEFAULT FALSE,
ADD COLUMN IF NOT EXISTS modification_completed BOOLEAN DEFAULT FALSE;
