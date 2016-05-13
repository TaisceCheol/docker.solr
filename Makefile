up:
	docker-compose up -d

down:
	docker-compose down

create:
	docker-compose run blacklight rake db:create

migrate:
	docker-compose run blacklight rake db:migrate

launch: 
	docker-compose up -d && \
	docker-compose run blacklight rake db:create && \
	docker-compose run blacklight rake db:migrate

index.solr:
	curl "http://docker:8983/solr/blacklight/update?commit=true" -H "Content-Type: text/xml" --data-binary "@sample_solr_import.xml"

clean.solr:
	curl "http://docker:8983/solr/blacklight/update?commit=true" -H "Content-Type: text/xml" --data-binary '<delete><query>*:*</query></delete>'
