# Deployment

ExactlyOne deploys only the gateway service for `exactlyone.dev`.

Child projects deploy independently. Route them through `exactlyone.dev` with
GCP load balancer path rules, Cloud Run domain mappings, or another explicit
routing layer.

## GCP Target

- Project: `project-6da9ef70-b473-43b3-b92`
- Region: `asia-east1`
- Artifact Registry repository: `exactlyone`
- Cloud Run service: `exactlyone-web`
- Domain: `exactlyone.dev`

## Runtime

The gateway container contains:

- static React build in `/app/dist`
- Rust gateway binary `/app/exactlyone-gateway`
- `/healthz`
- SPA fallback to `index.html`

Runtime environment:

```text
HOST=0.0.0.0
PORT=8080
STATIC_DIR=/app/dist
```

No database is required for the gateway.

## Deploy

```bash
PROJECT_ID=project-6da9ef70-b473-43b3-b92 npm run deploy:gcp
```

## Domain

`exactlyone.dev` should point to the gateway or to a load balancer in front of
the gateway and child services.

Recommended future path rules:

```text
/         -> ExactlyOne
/blog     -> Mortal
/algo     -> Algo-Lab
/helios   -> Helios
/easy-db  -> Easy-PG
/fluke    -> Fluke
```

DNS is managed at the domain registrar unless the domain is moved to Cloud DNS.
