import './App.css'
import { projectHref, projects } from './projects'

function App() {
  return (
    <main className="shell">
      <section className="hero" aria-labelledby="site-title">
        <p>ExactlyOne</p>
        <h1 id="site-title">Per aspera ad astra.</h1>
      </section>

      <nav className="project-list" aria-label="Project links">
        {projects.map(project => (
          <a key={project.id} href={projectHref(project)}>
            <span>{project.label}</span>
            <small>{project.kind}</small>
          </a>
        ))}
      </nav>
    </main>
  )
}

export default App
