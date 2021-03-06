CREATE OR REPLACE FUNCTION dropIfExists(TEXT, TEXT) RETURNS INTEGER AS '
BEGIN
  RETURN dropIfExists($1, $2, ''public'');
END;
' LANGUAGE 'plpgsql';


CREATE OR REPLACE FUNCTION dropIfExists(TEXT, TEXT, TEXT) RETURNS INTEGER AS '
DECLARE
  pType         ALIAS FOR $1;
  pObject       ALIAS FOR $2;
  pSchema       ALIAS FOR $3;
  _table	TEXT;
  _query	TEXT;
BEGIN
  IF (UPPER(pType) = ''TABLE'') THEN
    _query = ''DROP TABLE '' || quote_ident(LOWER(pSchema)) || ''.'' || quote_ident(LOWER(pObject));
    BEGIN
      RAISE NOTICE ''%'', _query;
      EXECUTE _query;
    EXCEPTION WHEN undefined_table THEN
		RAISE NOTICE ''No table % to drop'', pObject;
		RETURN 0;
	      WHEN OTHERS THEN RAISE EXCEPTION ''% %'', SQLSTATE, SQLERRM;
    END;
    RAISE NOTICE ''TABLE % dropped'', pObject;

  ELSIF (UPPER(pType) = ''VIEW'') THEN
    _query = ''DROP VIEW '' || quote_ident(LOWER(pSchema)) || ''.'' || quote_ident(LOWER(pObject));
    BEGIN
      RAISE NOTICE ''%'', _query;
      EXECUTE _query;
    EXCEPTION WHEN undefined_table THEN
		RAISE NOTICE ''No view % to drop'', pObject;
		RETURN 0;
	      WHEN OTHERS THEN RAISE EXCEPTION ''% %'', SQLSTATE, SQLERRM;
    END;
    RAISE NOTICE ''VIEW % dropped'', pObject;

  ELSIF (UPPER(pType) = ''TRIGGER'') THEN
    SELECT relname INTO _table
    FROM pg_trigger, pg_class
    WHERE ((tgrelid=pg_class.oid)
      AND  (UPPER(tgname)=UPPER(pObject)));
    IF (NOT FOUND) THEN
      _table := ''[no table]'';
    END IF;

    _query = ''DROP TRIGGER '' || quote_ident(LOWER(pObject)) ||
	     '' ON '' || quote_ident(LOWER(pSchema)) || ''.'' || quote_ident(LOWER(_table));
    BEGIN
      RAISE NOTICE ''%'', _query;
      EXECUTE _query;
    EXCEPTION WHEN undefined_object THEN
		RAISE NOTICE ''%'', SQLERRM;
		RETURN 0;
	      WHEN undefined_table THEN
		RAISE NOTICE ''Table % for trigger % does not exist'', _table, pObject;
		RETURN 0;
	      WHEN OTHERS THEN RAISE EXCEPTION ''% %'', SQLSTATE, SQLERRM;
    END;
    RAISE NOTICE ''TRIGGER % on % dropped'', pObject, _table;

  ELSIF (UPPER(pType) = ''CONSTRAINT'') THEN
    SELECT relname INTO _table
    FROM pg_constraint, pg_class, pg_namespace
    WHERE ((conrelid=pg_class.oid)
      AND  (connamespace=pg_namespace.oid)
      AND  (conname=pObject)
      AND  (nspname=pSchema));
    IF (NOT FOUND) THEN
      RAISE NOTICE ''No constraint % to drop'', pObject;
      RETURN 0;
    END IF;
    _query = ''ALTER TABLE '' || quote_ident(LOWER(pSchema)) || ''.'' || quote_ident(LOWER(_table))
             || '' DROP CONSTRAINT '' || quote_ident(LOWER(pObject));
    BEGIN
      RAISE NOTICE ''%'', _query;
      EXECUTE _query;
    EXCEPTION WHEN undefined_table THEN
		RAISE NOTICE ''No table % to alter'', _table;
		RETURN 0;
	      WHEN OTHERS THEN RAISE EXCEPTION ''% %'', SQLSTATE, SQLERRM;
    END;

  ELSE
    RAISE EXCEPTION ''dropIfExists(%, %): unknown pType %'', pType, pObject, pType;
  END IF;

  RETURN 1;

END;
' LANGUAGE 'plpgsql';
