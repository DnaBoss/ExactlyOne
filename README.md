# ExactlyOne

ExactlyOne is the public integration gateway for independently developed
projects.

It owns:

- the `exactlyone.dev` entrypoint
- shared navigation
- public routing conventions
- visual consistency for the top-level gateway
- deployment of the gateway service

It does not own:

- blog posts or blog admin logic
- algorithm tutorials or problem data
- trading data, research pipelines, broker operations, or private logs
- database connection profiles or schema inspection logic
- game engine, game services, or gameplay state

## Projects

| Project | Local path | Role |
| --- | --- | --- |
| Mortal | `../Mortal` | Blog |
| Algo-Lab | `../Algo-Lab` | Algorithm learning |
| Helios | `../Helios` | Quant platform |
| Easy-PG | `../Easy-PG` | PostgreSQL tool |
| Fluke | `../Fluke` | Game platform |

The source of truth is [`ecosystem.manifest.json`](ecosystem.manifest.json).

## Local Development

```bash
npm install
npm run dev
```

Run the Rust gateway locally:

```bash
npm run build
npm run dev:gateway
```

## Checks

```bash
npm run lint
npm run test
npm run build
npm run build:gateway
```

Before deploy:

```bash
npm run release:gate
```
