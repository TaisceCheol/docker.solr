#Irish Traditional Music Archive : metadata group
###ITMA dev solr setup for use with blacklight

To build image:

```bash
docker build -t itma.solr .
```

To launch:

```bash
docker-compose up
```

To import documents:

```bash
curl http://docker:8983/solr/blacklight/update?commit=true -H "Content-Type: text/xml" --data-binary @sample_solr_import.xml
```

To delete all documents:
```bash
curl http://docker:8983/solr/blacklight/update?commit=true -H "Content-Type: text/xml" --data-binary '<delete><query>*:*</query></delete>'
```

To stop and clean up:

```bash
docker-compose down
``` 
