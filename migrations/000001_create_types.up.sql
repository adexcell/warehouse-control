CREATE TYPE IF NOT EXISTS user_role AS ENUM ('admin', 'manager', 'viewer');
CREATE TYPE IF NOT EXISTS history_action AS ENUM ('CREATE', 'UPDATE', 'DELETE');
