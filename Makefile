.PHONY: up down create migrate launch relaunch index.solr clean.solr

up:
	docker-compose up -d

down:
	docker-compose down

create: up
	docker-compose run blacklight rake db:create

migrate: create
	docker-compose run blacklight rake db:migrate

prepare-db: migrate

launch: up migrate index.solr

relaunch: down up index.solr

index.solr:
	curl "http://localhost:8983/solr/blacklight/update?commit=true" -H "Content-Type: text/xml" --data-binary "@sample_solr_import.xml"

clean.solr:
	curl "http://localhost:8983/solr/blacklight/update?commit=true" -H "Content-Type: text/xml" --data-binary '<delete><query>*:*</query></delete>'
