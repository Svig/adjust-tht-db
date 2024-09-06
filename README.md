# adjust-tht-db

# MAX MIN Function

It is a function that accepts 4 parameters, column name, table name, format and a numeric array.

You can supply a column name and table name for it to scan the column for the max and min values.

Or you can supply a numeric array and it will output the max and min values.

Some error handling to ensure you are supplying the correct parameters and not just everyithing and with guiding notices/messages.

## Installation

Clone the repo
```bash
git clone https://github.com/Svig/adjust-tht-db.git
```

cd into the repo and 
```bash
cd adjust-tht-db/
```

Create the function
```bash
psql -h localhost -d testdb -U postgres < max_min.sql
```

Expected output
``` SQL
CREATE FUNCTION
```

## Usage
To test that the function has been created and running as expected, run the below and the output should be as expected
```bash
psql -h localhost -d testdb -U postgres < max_min_self_test.sql
```
Expected output
``` sql
CREATE TABLE
INSERT 0 589590
NOTICE:  No valid parameters passed
 min_max_vals
--------------
(0 rows)

NOTICE:  Supply missing column name for table name
 min_max_vals
--------------
(0 rows)

NOTICE:  Supply missing table name for column name
 min_max_vals
--------------
(0 rows)

  min_max_vals  
----------------
 589615 ---> 26
(1 row)

 min_max_vals
--------------
 9 ---> 1
(1 row)

DROP TABLE
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.
