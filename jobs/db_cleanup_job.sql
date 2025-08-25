\set months_ago 6

BEGIN;

DELETE FROM task
WHERE is_deleted = TRUE
  AND modified_at < NOW() - (:'months_ago' || ' months')::interval;

COMMIT;

VACUUM (VERBOSE, ANALYZE) task;