# ExactlyOne Agent Guide

## Repository Role

ExactlyOne is an integration gateway. Keep this repository thin.

Allowed here:

- top-level landing page and navigation
- shared route/link definitions
- ecosystem manifest
- gateway deployment files
- gateway engineering standards and architecture docs
- Rust static gateway service

Not allowed here:

- Blog content, blog editor logic, blog database migrations, or comments
- Algo-Lab problem bank, tutorials, dry-runs, ratings, or notes
- Helios market data, strategy logic, broker operations, or private logs
- Easy-PG connection profiles, SQL import/export logic, or schema browser logic
- Fluke game engine, game state, or service internals

## Project Boundaries

- Blog work belongs in `/Users/cash/work_space/private/Mortal`.
- Algorithm learning work belongs in `/Users/cash/work_space/private/Algo-Lab`.
- Quant platform work belongs in `/Users/cash/work_space/private/Helios`.
- PostgreSQL tool work belongs in `/Users/cash/work_space/private/Easy-PG`.
- Game work belongs in `/Users/cash/work_space/private/Fluke`.

ExactlyOne may link to these projects or define future reverse-proxy paths. It
must not copy their domain data or operational code.

## Engineering Rules

- Server-side services must be Rust when this repository needs a server.
- Keep UI rendering, project metadata, and gateway serving logic separated.
- Do not expose private planning notes, local credentials, deployment secrets,
  private logs, or hidden personal goals in public UI or docs.
- Public copy should be short and calm.
- Prefer updating `ecosystem.manifest.json` over hard-coding project lists in
  components.

## Checks

Run before handoff:

```bash
npm run lint
npm run test
npm run build
npm run build:gateway
```

Run before production deploy:

```bash
npm run release:gate
```
