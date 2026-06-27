# Инструкция для администратора Windows

## Установка k9s и k3s через winget

Откройте PowerShell от имени администратора и выполните следующие команды:

```powershell
# Установка k9s для мониторинга кластера
winget install -e --id derailed.k9s

# Установка k3s (в среде Windows это обычно устанавливает Rancher Desktop или k3d)
winget install k3s
```

## Запуск решения

1. Убедитесь, что ваш Kubernetes кластер (k3s) запущен и доступен (выполните `kubectl get nodes`).
2. Перейдите в директорию `additional`, где находятся Helm-чарты:
   ```powershell
   cd kubernetes-etl/additional
   ```
3. Выполните установку PostgreSQL и DBT-скриптов в Gcloud или локальный кластер:
   ```powershell
   helm install knowledge-graph .
   ```
4. Для проверки статуса подов запустите утилиту `k9s`:
   ```powershell
   k9s
   ```
5. Убедитесь, что под `postgresql` работает, а Job `dbt-run-job` успешно завершился. Витрины данных графа знаний будут сформированы.