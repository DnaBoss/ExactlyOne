import manifest from '../ecosystem.manifest.json'

export type ProjectKind = 'content' | 'learning' | 'platform' | 'tool' | 'game'

export type ProjectLink = {
  id: string
  name: string
  label: string
  kind: ProjectKind
  path: string
  repo: string | null
  publicPath: string
}

export const projects = manifest.children as ProjectLink[]

export function projectHref(project: ProjectLink) {
  const envKey = `VITE_${project.id.replaceAll('-', '_').toUpperCase()}_URL`
  return import.meta.env[envKey] || project.publicPath
}

export function gatewayRules() {
  return manifest.rules
}
