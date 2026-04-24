CREATE TABLE item_history (
    id BIGSERIAL PRIMARY KEY,
    item_id UUID NOT NULL, -- FK опущен, чтобы история сохранялась после удаления товара
    action history_action NOT NULL,
    old_values JSONB,
    new_values JSONB,
    changed_by UUID REFERENCES users(id),
    changed_at TIMESTAMPTZ DEFAULT NOW()
);
