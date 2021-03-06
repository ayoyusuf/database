BEGIN;

-- Address Characteristic

DROP VIEW api.addresschar;
CREATE VIEW api.addresschar
AS 
   SELECT 
     addr_id AS address_number,
     char_name::varchar(100) AS characteristic,
     charass_value AS value
   FROM addr, char, charass
   WHERE (('ADDR'=charass_target_type)
   AND (addr_id=charass_target_id)
   AND (charass_char_id=char_id));

GRANT ALL ON TABLE api.addresschar TO openmfg;
COMMENT ON VIEW api.addresschar IS 'Address Characteristics';

--Rules

CREATE OR REPLACE RULE "_INSERT" AS
    ON INSERT TO api.addresschar DO INSTEAD

  INSERT INTO charass (
    charass_target_type,
    charass_target_id,
    charass_char_id,
    charass_value,
    charass_default
    )
  VALUES (
    'ADDR',
    NEW.address_number,
    getCharId(NEW.characteristic,'ADDR'),
    NEW.value,
    false);

CREATE OR REPLACE RULE "_UPDATE" AS 
    ON UPDATE TO api.addresschar DO INSTEAD

  UPDATE charass SET
    charass_value=NEW.value
  WHERE ((charass_target_type='ADDR')
  AND (charass_target_id=OLD.address_number)
  AND (charass_char_id=getCharId(OLD.characteristic,'ADDR')));
           
CREATE OR REPLACE RULE "_DELETE" AS 
    ON DELETE TO api.addresschar DO INSTEAD

  DELETE FROM charass
  WHERE ((charass_target_type='ADDR')
  AND (charass_target_id=OLD.address_number)
  AND (charass_char_id=getCharId(OLD.characteristic,'ADDR')));

COMMIT;
