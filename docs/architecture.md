# Architecture

ExactlyOne is a gateway, not a monolith.

```text
Browser
  |
  v
exactlyone.dev
  |
  +-- ExactlyOne gateway
        |
        +-- /blog    -> Mortal
        +-- /algo    -> Algo-Lab
        +-- /helios  -> Helios
        +-- /easy-db -> Easy-PG
        +-- /fluke   -> Fluke
```

## Responsibilities

ExactlyOne owns:

- project discovery from `ecosystem.manifest.json`
- top-level public navigation
- gateway visual language
- gateway deployment
- health endpoint

Each child project owns:

- its own codebase
- its own backend
- its own database and migrations
- its own admin tools
- its own tests and release cadence
- its own private operations boundary

## Integration Rules

- Use links, reverse-proxy rules, or explicit adapters.
- Do not copy child project data into ExactlyOne.
- Do not add child project migrations or admin APIs here.
- Do not let a public gateway page expose private operations.
- Keep server-side gateway code in Rust.
