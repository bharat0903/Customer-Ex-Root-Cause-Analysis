#KPI Analysis
SELECT
  flight_id,
  AVG(checkin_wait_min) AS avg_checkin_wait,
  AVG(baggage_wait_min) AS avg_baggage_wait,
  AVG(inflight_service_rating) AS avg_inflight_rating,
  COUNT(*) AS passengers
FROM
  `airlines_data.united_customer_journey`
GROUP BY
  flight_id
ORDER BY
  flight_id;

#Top Friction Areas
SELECT
  'Check-in' AS issue_type,
  SUM(issue_checkin) AS occurrences
FROM `airlines_data.united_customer_journey`
UNION ALL
SELECT
  'Baggage',
  SUM(issue_baggage)
FROM `airlines_data.united_customer_journey`
UNION ALL
SELECT
  'In-flight',
  SUM(issue_inflight)
FROM `airlines_data.united_customer_journey`
ORDER BY occurrences DESC;

#Which Issues Drive Low NPS?
SELECT
  issue_type,
  avg_nps
FROM (
  SELECT 'checkin' AS issue_type,
         AVG(nps_score) AS avg_nps
  FROM `airlines_data.united_customer_journey`
  WHERE issue_checkin = 1

  UNION ALL

  SELECT 'baggage',
         AVG(nps_score)
  FROM `airlines_data.united_customer_journey`
  WHERE issue_baggage = 1

  UNION ALL

  SELECT 'inflight',
         AVG(nps_score)
  FROM `airlines_data.united_customer_journey`
  WHERE issue_inflight = 1
)
ORDER BY avg_nps ASC;

#Flights With High Check-in Wait Times
SELECT
  flight_id,
  AVG(checkin_wait_min) AS avg_checkin_wait
FROM
  `airlines_data.united_customer_journey`
GROUP BY
  flight_id
HAVING
  AVG(checkin_wait_min) > 25
ORDER BY
  avg_checkin_wait DESC;

#Delay Ranking 
SELECT
  flight_id,
  AVG(total_issues) AS avg_issues,
  DENSE_RANK() OVER (ORDER BY AVG(total_issues) DESC) AS issue_rank
FROM
  `airlines_data.united_customer_journey`
GROUP BY
  flight_id
ORDER BY
  issue_rank;