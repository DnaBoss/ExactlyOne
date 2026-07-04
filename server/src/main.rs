use std::{env, net::SocketAddr};

use axum::{Router, routing::get};
use tower_http::services::{ServeDir, ServeFile};

#[tokio::main]
async fn main() -> anyhow::Result<()> {
    let host = env::var("HOST").unwrap_or_else(|_| "0.0.0.0".to_string());
    let port = env::var("PORT")
        .ok()
        .and_then(|value| value.parse::<u16>().ok())
        .unwrap_or(8080);
    let static_dir = env::var("STATIC_DIR").unwrap_or_else(|_| "dist".to_string());
    let index_file = format!("{static_dir}/index.html");

    let app = Router::new()
        .route("/healthz", get(|| async { "ok" }))
        .fallback_service(ServeDir::new(&static_dir).fallback(ServeFile::new(index_file)));

    let addr: SocketAddr = format!("{host}:{port}").parse()?;
    let listener = tokio::net::TcpListener::bind(addr).await?;
    axum::serve(listener, app).await?;

    Ok(())
}
