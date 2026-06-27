{{
  config(materialized='table')
}}

-- Mock данные для узлов Knowledge Graph
WITH dummy_data AS (
    SELECT 'material' as node_type, 'm1' as node_id, 'Сплав X' as node_name UNION ALL
    SELECT 'experiment' as node_type, 'e1' as node_id, 'Эксперимент 101' as node_name UNION ALL
    SELECT 'property' as node_type, 'p1' as node_id, 'Высокая прочность' as node_name UNION ALL
    SELECT 'mode' as node_type, 'mod1' as node_id, 'Режим Y (1000 градусов)' as node_name
)

SELECT * FROM dummy_data
