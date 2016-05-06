#Irish Traditional Music Archive : metadata group
###ITMA dev solr setup for use with blacklight

To build image:

```docker
docker build -t itma.solr .
```

To launch:

```docker
docker-compose up
```

To import documents:

```bash
curl http://docker:8983/solr/blacklight/update?commit=true -H "Content-Type: text/xml" --data-binary @sample_solr_import.xml
```

To stop and clean up:

```docker
docker-compose down
``` 