----------
-- Step 0 - Create a Query 
----------
-- Query: Select all cats that have a toy with an id of 5

    -- Your code here 
    SELECT * FROM cats
    JOIN  cat_toys ON cats.id = cat_toys.cat_id
    JOIN toys ON toys.id=cat_toys.toy_id
    WHERE toys.id=5;

-- Paste your results below (as a comment):
-- 4002|Rachele|Maroon|Foldex Cat|4509|4002|5|5|Shiny Mouse|Blue|7
-- 31|Rodger|Lavender|Oregon Rex|10008|31|5|5|Shiny Mouse|Blue|7
-- 77|Jamal|Orange|Sam Sawet|10051|77|5|5|Shiny Mouse|Blue|7




----------
-- Step 1 - Analyze the Query
----------
-- Query:

    -- Your code here 
    -- EXPLAIN QUERY PLAN SELECT * FROM cats
    -- JOIN  cat_toys ON cats.id = cat_toys.cat_id
    -- JOIN toys ON toys.id=cat_toys.toy_id
    -- WHERE toys.id=5;

-- Paste your results below (as a comment):
-- QUERY PLAN
-- |--SEARCH toys USING INTEGER PRIMARY KEY (rowid=?)
-- |--SCAN cat_toys
-- |--SEARCH cats USING INTEGER PRIMARY KEY (rowid=?)

-- What do your results mean?

    -- Was this a SEARCH or SCAN?
    -- SEARCH and SCAN


    -- What does that mean?
    -- The query searches the toys/cats tables but scans the interaction table, so not compeltely optimized



----------
-- Step 2 - Time the Query to get a baseline
----------
-- Query (to be used in the sqlite CLI):

    -- Your code here
    -- .timer ON
    -- the SELECT ... query 

-- Paste your results below (as a comment):
-- Run Time: real 0.001 user 0.000799 sys 0.000267




----------
-- Step 3 - Add an index and analyze how the query is executing
----------

-- Create index:

    -- Your code here 
    -- CREATE INDEX cat_id_idx ON cat_toys(cat_id); no diff
    -- CREATE INDEX toy_id_idx ON cat_toys(toy_id); made the change

-- Analyze Query:
    -- Your code here 
    -- EXPLAIN QUERY PLAN SELECT * FROM cats
    -- JOIN  cat_toys ON cats.id = cat_toys.cat_id
    -- JOIN toys ON toys.id=cat_toys.toy_id
    -- WHERE toys.id=5;

-- Paste your results below (as a comment):
    -- |--SEARCH toys USING INTEGER PRIMARY KEY (rowid=?)
    -- |--SEARCH cat_toys USING INDEX toy_id_idx (toy_id=?)
    -- |--SEARCH cats USING INTEGER PRIMARY KEY (rowid=?)


-- Analyze Results:

    -- Is the new index being applied in this query?

    -- Yes, it is


----------
-- Step 4 - Re-time the query using the new index
----------
-- Query (to be used in the sqlite CLI):

    -- Your code here 
    -- .timer on
    -- the original query
    -- .timer off

-- Paste your results below (as a comment):
-- Run Time: real 0.001 user 0.000146 sys 0.000138

-- Analyze Results:
    -- Are you still getting the correct query results?

    -- yes
    -- Did the execution time improve (decrease)?

    -- yes
    -- Do you see any other opportunities for making this query more efficient?

    -- no
---------------------------------
-- Notes From Further Exploration
---------------------------------
