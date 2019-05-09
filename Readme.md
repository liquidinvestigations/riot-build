```
exec docker run \
  --volume ./config.json:/usr/local/apache2/htdocs/config.json:ro \
  liquidinvestigations/riot
```

It will listen on port 80.
