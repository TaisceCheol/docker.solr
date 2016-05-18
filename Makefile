up:
	docker-compose up -d

down:
	docker-compose down

create:
	docker-compose run blacklight rake db:create

migrate:
	docker-compose run blacklight rake db:migrate

launch: 
	docker-compose run blacklight rake db:create && \
	docker-compose run blacklight rake db:migrate && \
	docker-compose up -d; 


index.solr:
	curl "http://localhost:8983/solr/blacklight/update?commit=true" -H "Content-Type: text/xml" --data-binary "@sample_solr_import.xml"

clean.solr:
	curl "http://localhost:8983/solr/blacklight/update?commit=true" -H "Content-Type: text/xml" --data-binary '<delete><query>*:*</query></delete>'
