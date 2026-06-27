### Целевое решение:
- ETL документов (PDF/таблицы/протоколы) -> chunking -> embeddings -> hybrid retrieval (BM25 + vector).
- Извлечение сущностей и связей (материал, эксперимент, параметр, результат, автор).
- Построение графа знаний с объяснимой выдачей и цитированием источников.

### Архитектура:
- Data layer: PostgreSQL + pgvector или OpenSearch.
- KG layer: Neo4j (опционально).
- NLP layer: Transformer encoder + reranker.
- API layer: FastAPI.
- UI: web-интерфейс для навигации по связям и пробелам в исследованиях.
