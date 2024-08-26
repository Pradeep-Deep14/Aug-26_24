CREATE TABLE Activity (
    machine_id INT,
    process_id INT,
    activity_type VARCHAR(10),
    timestamp FLOAT
);

INSERT INTO Activity (machine_id, process_id, activity_type, timestamp)
VALUES
(1, 1, 'start', 10.5),
(1, 1, 'end', 15.0),
(1, 2, 'start', 20.0),
(1, 2, 'end', 25.5),
(2, 1, 'start', 5.0),
(2, 1, 'end', 12.5),
(2, 2, 'start', 15.0),
(2, 2, 'end', 20.0);

SELECT * FROM ACTIVITY

SELECT MACHINE_ID,
	   AVG(END_TIME - START_TIME)AS AVG_PROCESS_TIME
FROM 
(SELECT MACHINE_ID,
       PROCESS_ID,
       MAX(CASE WHEN ACTIVITY_TYPE='end' THEN TIMESTAMP END) AS END_TIME,
       MAX(CASE WHEN ACTIVITY_TYPE='start' THEN TIMESTAMP END) AS START_TIME
FROM ACTIVITY
GROUP BY 1,2) AS A
GROUP BY 1
ORDER BY 1

--Basically we are pivotting the table for separating the End time and Start Time
-- Then we have calculated the average
