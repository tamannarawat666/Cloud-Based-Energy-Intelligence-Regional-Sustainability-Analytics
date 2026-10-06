SELECT *
FROM `bigquery-public-data.google_cfe.datacenter_cfe`
LIMIT 20;

select count(*) as total_rows from `bigquery-public-data.google_cfe.datacenter_cfe`;

SELECT
  column_name,
  data_type
FROM `bigquery-public-data.google_cfe.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'datacenter_cfe'
ORDER BY ordinal_position;

select min(year)as earliest_year ,max(year) as latest_year,count(distinct(year)) as total_year 
from `bigquery-public-data.google_cfe.datacenter_cfe`;

select cfe_region,count(*) as record from `bigquery-public-data.google_cfe.datacenter_cfe` 
group by cfe_region order by record desc;

select cloud_region ,count(*) as record from `bigquery-public-data.google_cfe.datacenter_cfe`
group by cloud_region order by record desc;

select location,count(*) as record from `bigquery-public-data.google_cfe.datacenter_cfe`
group by location order by record desc;

select count(*) as total_rows,
countif(year is null) as missing_year,
countif(cfe_region is null ) as missing_cfe_region,
countif(zone_id is null ) as missing_zone_id,
countif(cloud_region is null) as missing_cloud_region,
countif(location is null ) as missing_location,
countif(google_cfe is null) as missing_google_cfe,
countif(grid_carbon_intensity is null ) as missing_grid_carbon_intensity
from `bigquery-public-data.google_cfe.datacenter_cfe`;

SELECT
    year,
    COUNT(*) AS records
FROM `bigquery-public-data.google_cfe.datacenter_cfe`
GROUP BY year
ORDER BY year;

SELECT
    year,
    cfe_region,
    zone_id,
    cloud_region,
    location,
    google_cfe,
    grid_carbon_intensity
FROM `bigquery-public-data.google_cfe.datacenter_cfe`
WHERE google_cfe IS NULL
   OR grid_carbon_intensity IS NULL
ORDER BY year, cloud_region;

CREATE OR REPLACE TABLE `tidy-chimera-485814-q0.energy_analytics.energy_clean` AS

SELECT
    year,
    cfe_region,
    zone_id,
    cloud_region,
    location,
    google_cfe,
    grid_carbon_intensity,

    CASE
        WHEN google_cfe IS NULL THEN 'Missing'
        ELSE 'Available'
    END AS cfe_data_status,

    CASE
        WHEN grid_carbon_intensity IS NULL THEN 'Missing'
        ELSE 'Available'
    END AS carbon_data_status

FROM `bigquery-public-data.google_cfe.datacenter_cfe`;


SELECT *
FROM `tidy-chimera-485814-q0.energy_analytics.energy_clean`
LIMIT 20;

SELECT
    cloud_region,
    location,
    year,
    google_cfe,

    LAG(google_cfe) OVER (
        PARTITION BY cloud_region
        ORDER BY year
    ) AS previous_year_cfe,

    ROUND(
        google_cfe -
        LAG(google_cfe) OVER (
            PARTITION BY cloud_region
            ORDER BY year
        ),
        2
    ) AS cfe_change,

    ROUND(
        SAFE_DIVIDE(
            google_cfe -
            LAG(google_cfe) OVER (
                PARTITION BY cloud_region
                ORDER BY year
            ),
            LAG(google_cfe) OVER (
                PARTITION BY cloud_region
                ORDER BY year
            )
        ) * 100,
        2
    ) AS cfe_change_percent

FROM `tidy-chimera-485814-q0.energy_analytics.energy_clean`

ORDER BY cloud_region, year;


CREATE OR REPLACE TABLE
`tidy-chimera-485814-q0.energy_analytics.regional_sustaninability_analysis` AS

SELECT
    year,
    location,
    cfe_region,
    COUNT(*) AS region_records,

    ROUND(AVG(google_cfe), 2) AS avg_cfe,
    ROUND(AVG(grid_carbon_intensity), 2) AS avg_grid_carbon_intensity,

    MIN(google_cfe) AS min_cfe,
    MAX(google_cfe) AS max_cfe,

    MIN(grid_carbon_intensity) AS min_grid_carbon_intensity,
    MAX(grid_carbon_intensity) AS max_grid_carbon_intensity

FROM
`tidy-chimera-485814-q0.energy_analytics.energy_clean`

GROUP BY
    year,
    location,
    cfe_region

ORDER BY
    year,
    avg_cfe DESC;




CREATE OR REPLACE TABLE
`tidy-chimera-485814-q0.energy_analytics.regional_sstainability_score` AS

WITH regional_data AS (

    SELECT
        location,
        AVG(avg_cfe) AS avg_cfe,
        AVG(avg_grid_carbon_intensity) AS avg_grid_carbon_intensity

    FROM
    `tidy-chimera-485814-q0.energy_analytics.regional_sustaninability_analysis`

    GROUP BY
        location
),

normalized_data AS (

    SELECT
        location,
        avg_cfe,
        avg_grid_carbon_intensity,

        SAFE_DIVIDE(
            avg_cfe - MIN(avg_cfe) OVER (),
            MAX(avg_cfe) OVER () - MIN(avg_cfe) OVER ()
        ) * 100 AS cfe_score,

        (
            1 - SAFE_DIVIDE(
                avg_grid_carbon_intensity -
                MIN(avg_grid_carbon_intensity) OVER (),
                MAX(avg_grid_carbon_intensity) OVER () -
                MIN(avg_grid_carbon_intensity) OVER ()
            )
        ) * 100 AS carbon_score

    FROM regional_data
)

SELECT
    location,
    ROUND(avg_cfe, 2) AS avg_cfe,
    ROUND(avg_grid_carbon_intensity, 2) AS avg_grid_carbon_intensity,
    ROUND(cfe_score, 2) AS cfe_score,
    ROUND(carbon_score, 2) AS carbon_score,

    ROUND(
        (cfe_score + carbon_score) / 2,
        2
    ) AS sustainability_score

FROM normalized_data

ORDER BY sustainability_score DESC;





