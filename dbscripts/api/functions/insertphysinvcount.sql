CREATE OR REPLACE FUNCTION api.insertPhysInvCount(api.physinvcount) RETURNS boolean AS $$
-- Copyright (c) 1999-2012 by OpenMFG LLC, d/b/a xTuple. 
-- See www.xtuple.com/CPAL for the full text of the software license.
DECLARE
  pNEW ALIAS FOR $1;
  _itemid INTEGER;
  _type TEXT;
  _siteid INTEGER;
  _itemsiteid INTEGER;
  _controlmethod TEXT;
  _loccntrl BOOLEAN;
  _locationid INTEGER;
  _invcntid INTEGER;

BEGIN

  -- Check Item
  SELECT item_id, item_type INTO _itemid, _type
  FROM item
  WHERE (item_number=UPPER(pNEW.item_number));
  IF (NOT FOUND OR _type IN ('F', 'R', 'L','J')) THEN
    SELECT item_id, item_type INTO _itemid, _type
    FROM item
    WHERE (item_upccode=pNEW.item_number);
    IF (NOT FOUND OR _type IN ('F', 'R', 'L','J')) THEN
      RAISE EXCEPTION 'Function insertPhysInvCount failed because Item % not found or invalid type', pNEW.item_number;
    END IF;
  END IF;

  -- Check Site
  SELECT warehous_id INTO _siteid
  FROM whsinfo
  WHERE (warehous_code=COALESCE(pNEW.site, (SELECT warehous_code
                                            FROM usrpref,whsinfo
                                            WHERE (usrpref_username=getEffectiveXtUser())
                                              AND (usrpref_name='PreferredWarehouse')
                                              AND (warehous_id=CAST(usrpref_value AS INTEGER)))));
  IF (NOT FOUND) THEN
    RAISE EXCEPTION 'Function insertPhysInvCount failed because Site % not found', pNEW.site;
  END IF;

  -- Check Itemsite
  SELECT itemsite_id, itemsite_controlmethod, itemsite_loccntrl INTO _itemsiteid, _controlmethod, _loccntrl
  FROM itemsite
  WHERE (itemsite_item_id=_itemid)
    AND (itemsite_warehous_id=_siteid);
  IF (NOT FOUND) THEN
    RAISE EXCEPTION 'Function insertPhysInvCount failed because Itemsite %, % not found', pNEW.site, pNEW.item_number;
  END IF;
  IF (_controlmethod != 'R') THEN
    RAISE EXCEPTION 'Function insertPhysInvCount failed because Itemsite %, % not regular control method', pNEW.site, pNEW.item_number;
  END IF;
  IF (_loccntrl) THEN
    IF (pNEW.location IS NULL) THEN
      RAISE EXCEPTION 'Function insertPhysInvCount failed because Itemsite %, % multi location and location not provided', pNEW.site, pNEW.item_number;
    ELSE
      -- Check Location
      SELECT location_id INTO _locationid
      FROM location
      WHERE (location_id=getLocationId(pNEW.site, pNEW.location));
      IF (NOT FOUND) THEN
        RAISE EXCEPTION 'Function insertPhysInvCount failed because Location %, % not found', pNEW.site, pNEW.location;
      END IF;
    END IF;
  END IF;

  -- Create Count Tag
  SELECT CreateCountTag(_itemsiteid, pNEW.comment, FALSE, FALSE) INTO _invcntid;
  IF (_invcntid <= 0) THEN
    RAISE EXCEPTION 'Function insertPhysInvCount failed because CreateCountTag failed for Itemsite %, %', pNEW.site, pNEW.item_number;
  END IF;

  -- Create Count Slip
  INSERT INTO cntslip
  ( cntslip_cnttag_id,
    cntslip_username, cntslip_entered, cntslip_posted,
    cntslip_number, cntslip_qty,
    cntslip_location_id, cntslip_lotserial,
    cntslip_lotserial_expiration,
    cntslip_lotserial_warrpurc,
    cntslip_comments )
  VALUES
  ( _invcntid,
    getEffectiveXtUser(), CURRENT_TIMESTAMP, FALSE,
    'N/A', pNEW.quantity,
    _locationid, pNEW.lotserial,
    NULL,
    NULL,
    pNEW.comment );

  RETURN TRUE;
END;
$$ LANGUAGE 'plpgsql';