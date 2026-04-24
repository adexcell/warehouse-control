CREATE INDEX IF NOT EXISTS idx_history_item_id ON item_history(item_id);
CREATE INDEX IF NOT EXISTS idx_history_changed_at ON item_history(changed_at DESC);
CREATE INDEX IF NOT EXISTS idx_history_action ON item_history(action);
CREATE INDEX IF NOT EXISTS idx_history_changed_by ON item_history(changed_by);
