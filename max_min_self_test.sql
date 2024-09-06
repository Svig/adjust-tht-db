CREATE TABLE table_test_function (id INT);

-- start and end values can be changed as desired
INSERT INTO table_test_function SELECT * FROM generate_series(26,589615);

SELECT * 
FROM max_to_min(NULL, NULL, '--->', NULL) 
AS result(max_min_vals TEXT);

SELECT * 
FROM max_to_min(NULL,'table_test_function', '--->', NULL) 
AS result(max_min_vals TEXT);

SELECT * 
FROM max_to_min('id', NULL, '--->', NULL) 
AS result(max_min_vals TEXT);

SELECT * 
FROM max_to_min('id','table_test_function', '--->', NULL) 
AS result(max_min_vals TEXT);

SELECT * 
FROM max_to_min(NULL, NULL, '--->', ARRAY[1, 3, 5, 7, 9, 2, 8]) 
AS result(max_min_vals TEXT);

DROP TABLE IF EXISTS table_test_function;

