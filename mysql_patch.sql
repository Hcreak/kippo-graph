-- Add this patch By Hcreak 2018.5.22
-- for mysql database (tested)

CREATE INDEX index_session ON ttylog(session);

ALTER TABLE ttylog ADD size varchar(7);

UPDATE ttylog SET size = ROUND(LENGTH(ttylog)/1024, 2);

CREATE TRIGGER trigger_size BEFORE INSERT ON ttylog FOR EACH ROW
    set new.size = ROUND(LENGTH(new.ttylog)/1024, 2);
