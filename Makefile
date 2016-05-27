.PHONY: up down create migrate launch relaunch index.solr clean.solr pport 

up:
	docker-compose up -d

down:
	docker-compose down

create: up
	sleep 1 &&\
	./portcheck -p $$(docker ps | grep postgres | awk '{print $$10}' | sed -E 's/.*\:(.*)\-.*/\1/') && \
	./portcheck -p 3000 && \
	docker-compose run blacklight rake db:create

migrate: create
	docker-compose run blacklight rake db:migrate

prepare-db: migrate

launch: up migrate index.solr

relaunch: down up index.solr

index.solr:
	./portcheck -p 8983 && \
	curl "http://localhost:8983/solr/blacklight/update?commit=true" -H "Content-Type: text/xml" --data-binary "@sample_solr_import.xml"

clean.solr:
	curl "http://localhost:8983/solr/blacklight/update?commit=true" -H "Content-Type: text/xml" --data-binary '<delete><query>*:*</query></delete>'
