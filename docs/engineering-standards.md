# Engineering Standards

ExactlyOne is a gateway repository. Keep it small.

## Boundaries

- Add project links and route metadata to `ecosystem.manifest.json`.
- Keep child project source code in the child project repository.
- Do not add child project databases, migrations, admin panels, data exports,
  strategy logic, problem banks, or blog authoring logic here.
- Public UI must not show internal planning, private operations, local paths, or
  credentials.

## Server-Side Rule

When ExactlyOne needs a service, it must be Rust.

The current Rust service is only a static gateway:

- serves the built frontend
- exposes `/healthz`
- falls back to `index.html` for SPA routes

## Design Pattern Use

Use boundaries before abstractions:

- Manifest pattern for project registration.
- Adapter pattern only when ExactlyOne must call a child service.
- Gateway pattern for routing public traffic.

Avoid adding layers that make the gateway look like a child project.

## Tests

Minimum checks:

```bash
npm run lint
npm run test
npm run build
npm run build:gateway
```

Add tests when:

- project manifest parsing changes
- route/link generation changes
- gateway server behavior changes
- deployment scripts change

Child project tests belong in child project repositories.
