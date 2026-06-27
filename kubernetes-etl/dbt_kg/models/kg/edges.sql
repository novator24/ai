{{
  config(materialized='table')
}}

-- Mock данные для связей Knowledge Graph
WITH dummy_edges AS (
    SELECT 'e1' as source_id, 'm1' as target_id, 'USES_MATERIAL' as relation_type UNION ALL
    SELECT 'e1' as source_id, 'mod1' as target_id, 'UNDER_MODE' as relation_type UNION ALL
    SELECT 'e1' as source_id, 'p1' as target_id, 'RESULTS_IN' as relation_type
)

SELECT * FROM dummy_edges
