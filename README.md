# synthea-ndjson

```
docker build . -t synthea
```

```
docker run --rm -v ./output:/synthea/output -it synthea -p 1
```

```
chmod +x patch-synthea-ndjsons.sh
./patch-synthea-ndjsons.sh output/fhir
```

```
zip -j fhir1.zip output/fhir/*.*
```
