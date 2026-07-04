import { describe, expect, it } from 'vitest'
import { gatewayRules, projects } from './projects'

describe('ExactlyOne project boundaries', () => {
  it('keeps child projects as external entries', () => {
    expect(projects.map(project => project.name)).toEqual([
      'Mortal',
      'Algo-Lab',
      'Helios',
      'Easy-PG',
      'Fluke',
    ])
    expect(projects.every(project => project.publicPath.startsWith('/'))).toBe(true)
  })

  it('states that project internals stay in their own repos', () => {
    expect(gatewayRules().join(' ')).toMatch(/stay inside the owning project/)
  })
})
