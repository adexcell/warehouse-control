CREATE OR REPLACE FUNCTION log_item_changes() RETURNS TRIGGER AS $$
DECLARE
    v_user_id UUID;
    v_action  history_action;
BEGIN
    -- Берём ID пользователя из сессионной переменной
    v_user_id := NULLIF(current_setting('app.user_id', true), '')::UUID;
    v_action  := TG_OP::history_action;

    IF TG_OP = 'DELETE' THEN
        INSERT INTO item_history (item_id, action, old_values, changed_by, changed_at)
        VALUES (OLD.id, v_action, to_jsonb(OLD), v_user_id, NOW());
        RETURN OLD;
    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO item_history (item_id, action, old_values, new_values, changed_by, changed_at)
        VALUES (OLD.id, v_action, to_jsonb(OLD), to_jsonb(NEW), v_user_id, NOW());
        RETURN NEW;
    ELSIF TG_OP = 'INSERT' THEN
        INSERT INTO item_history (item_id, action, new_values, changed_by, changed_at)
        VALUES (NEW.id, v_action, to_jsonb(NEW), v_user_id, NOW());
        RETURN NEW;
    END IF;

    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_item_audit
AFTER INSERT OR UPDATE OR DELETE ON items
FOR EACH ROW EXECUTE FUNCTION log_item_changes();
