{{
  config(materialized='view')
}}

-- Представление для поиска ответов на вопросы вида: 
-- "что уже делали по сплавам X при режиме Y и какой был эффект на свойство Z"

SELECT 
    e.node_name as experiment_name,
    m.node_name as material_name,
    mod.node_name as mode_name,
    p.node_name as property_effect
FROM {{ ref('nodes') }} e
JOIN {{ ref('edges') }} edge_m 
  ON e.node_id = edge_m.source_id AND edge_m.relation_type = 'USES_MATERIAL'
JOIN {{ ref('nodes') }} m 
  ON edge_m.target_id = m.node_id
JOIN {{ ref('edges') }} edge_mod 
  ON e.node_id = edge_mod.source_id AND edge_mod.relation_type = 'UNDER_MODE'
JOIN {{ ref('nodes') }} mod 
  ON edge_mod.target_id = mod.node_id
JOIN {{ ref('edges') }} edge_p 
  ON e.node_id = edge_p.source_id AND edge_p.relation_type = 'RESULTS_IN'
JOIN {{ ref('nodes') }} p 
  ON edge_p.target_id = p.node_id
WHERE e.node_type = 'experiment'
