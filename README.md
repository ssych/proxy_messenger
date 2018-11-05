# README

Для развёртывания локально

bundle install --without production
rake db:setup
rails s
sidekiq -C config/sidekiq/proxy_messenger.yml

Пример запросов:

Отправить сообщение:

curl -X POST \
  http://localhost:3000/v1/telegram.json \
  -H 'Content-Type: application/json' \
  -d '{
  "user_id": 1,
  "data": "text message"
}'

Получить результат:

curl -X GET \
  http://localhost:3000/v1/telegram/b3798fe5-2809-4d79-98cb-656295be3ca1.json \
  -H 'Content-Type: application/json' \


Отправить сообщение нескольким провайдерам:

curl -X POST \
  http://localhost:3000/v1/package.json \
  -H 'Cache-Control: no-cache' \
  -H 'Content-Type: application/json' \
  -d '{
  "providers": ["telegram", "viber"],
  "user_id": 1,
  "data": "text message"
}'

Получить результат:
curl -X GET \
  http://localhost:3000/v1/package/e68ce89a-194e-41b8-b4bb-a29c922fa92f.json \
  -H 'Cache-Control: no-cache' \
  -H 'Content-Type: application/json' \
