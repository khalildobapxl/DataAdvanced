DECLARE
    v_countryid locations.COUNTRY_ID%TYPE DEFAULT 'CA';
    v_loc_id locations.LOCATION_ID%TYPE;
    v_counter NUMBER(2) := 1;
    v_new_city locations.city%TYPE := 'Montreal';
BEGIN
    SELECT MAX(LOCATION_ID) INTO v_loc_id FROM LOCATIONS
    WHERE country_id = v_countryid;
    WHILE v_counter <= 3 LOOP
        INSERT INTO LOCATIONS(LOCATION_ID, city, country_id)
        VALUES ((v_loc_id + v_counter), v_new_city, v_countryid);
        v_counter := v_counter + 1;
    END LOOP;
END;