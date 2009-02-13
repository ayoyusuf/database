-- NO create trigger statements. the updater will create them.
SELECT dropIfExists('TRIGGER', 'pkgimagebeforetrigger');
CREATE OR REPLACE FUNCTION _pkgimagebeforetrigger() RETURNS "trigger" AS $$
DECLARE
  _imageid     INTEGER;
  _debug       BOOL := false;

BEGIN
  IF (TG_OP = 'UPDATE') THEN
    IF (_debug) THEN
      RAISE NOTICE 'OLD.image_name %, NEW.image_name %',
                   OLD.image_name, NEW.image_name;
    END IF;

    IF (NEW.image_name != OLD.image_name) THEN
      SELECT image_id INTO _imageid FROM image WHERE image_name=NEW.image_name;
      IF (FOUND) THEN
        RAISE EXCEPTION 'Cannot change image named % because another image with that name already exists.', NEW.image_name;
      END IF;
    END IF;

  ELSIF (TG_OP = 'INSERT') THEN
    IF (_debug) THEN
      RAISE NOTICE 'inserting NEW.image_name %', NEW.image_name;
    END IF;
    SELECT image_id INTO _imageid FROM image WHERE image_name=NEW.image_name;
    IF (FOUND) THEN
      RAISE EXCEPTION 'Cannot create new image % because another image with that name already exists.', NEW.image_name;
    END IF;

  ELSIF (TG_OP = 'DELETE') THEN
    RETURN OLD;

  END IF;

  RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION _pkgimagealterTrigger() RETURNS TRIGGER AS $$
BEGIN
  IF (pkgMayBeModified(TG_TABLE_SCHEMA)) THEN
    IF (TG_OP = 'DELETE') THEN
      RETURN OLD;
    ELSE
      RETURN NEW;
    END IF;
  END IF;

  IF (TG_OP = 'INSERT') THEN
    RAISE EXCEPTION 'You may not create images in packages except using the xTuple Updater utility';

  ELSIF (TG_OP = 'UPDATE') THEN
    RAISE EXCEPTION 'You may not alter images in packages except using the xTuple Updater utility';

  ELSIF (TG_OP = 'DELETE') THEN
    RAISE EXCEPTION 'You may not delete images from packages. Try deleting or disabling the package.';

  END IF;

  RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';

CREATE OR REPLACE FUNCTION _pkgimageaftertrigger() RETURNS TRIGGER AS $$
BEGIN
  IF (TG_OP = 'DELETE') THEN
    DELETE FROM pkgitem
    WHERE ((pkgitem_type='I')
       AND (pkgitem_item_id=OLD.image_id)
       AND (pkgitem_pkghead_id IN (SELECT pkghead_id
                                   FROM pkghead
                                   WHERE pkghead_name = TG_TABLE_SCHEMA)));
    RETURN OLD;
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE 'plpgsql';