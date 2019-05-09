# Riot, packaged for Liquid

```
exec docker run \
  --volume ./config.json:/usr/local/apache2/htdocs/config.json:ro \
  liquidinvestigations/riot
```

It will listen on port 80.

Example `config.json`:
```json
{
  "default_hs_url": "http://synapse.example.org",
  "default_is_url": "",
  "brand": "My Riot",
  "integrations_ui_url": "",
  "integrations_rest_url": "",
  "bug_report_endpoint_url": "",
  "default_federate": false,
  "roomDirectory": null,
  "welcomeUserId": "@riot-bot:synapse.example.org",
  "piwik": null
}
```
