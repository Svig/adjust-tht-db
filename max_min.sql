
CREATE OR REPLACE FUNCTION max_to_min(
    col_name TEXT DEFAULT NULL,
    tbl_name TEXT DEFAULT NULL,
    fmt TEXT DEFAULT '->',
    value NUMERIC[] DEFAULT NULL
) 
RETURNS SETOF RECORD AS $$
BEGIN
	IF col_name IS NULL AND tbl_name IS NULL AND value IS NULL THEN
		RAISE NOTICE 'No valid parameters passed';
	ELSEIF col_name IS NULL AND tbl_name IS NOT NULL AND value IS NULL THEN
		RAISE NOTICE 'Supply missing column name for table name';
	ELSEIF col_name IS NOT NULL AND tbl_name IS NULL AND value IS NULL THEN
		RAISE NOTICE 'Supply missing table name for column name';
	ELSEIF col_name IS NOT NULL AND tbl_name IS NOT NULL AND value IS NOT NULL THEN
		RAISE NOTICE 'Supply either column name and table name OR a numeric array';
	ELSEIF col_name IS NULL AND tbl_name IS NULL AND value IS NOT NULL THEN
        RETURN QUERY SELECT FORMAT('%s ' || fmt || ' %s', MAX(val), MIN(val)) AS max_min_vals FROM unnest(value) AS val;
    ELSEIF col_name IS NOT NULL AND tbl_name IS NOT NULL AND value IS NULL THEN
		RETURN QUERY EXECUTE 'SELECT FORMAT(''%s ' || $3 || ' %s'', MAX(' || $1 || '), MIN(' || $1 || ') ) AS max_min_vals FROM ' || $2 || ';';
	ELSE
        RAISE NOTICE 'Something went wrong';
    END IF;
END;
$$ LANGUAGE plpgsql;

