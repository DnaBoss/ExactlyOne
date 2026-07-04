#!/usr/bin/env bash
set -euo pipefail

PROJECT_ID="${PROJECT_ID:-project-6da9ef70-b473-43b3-b92}"
REGION="${REGION:-asia-east1}"
REPOSITORY="${REPOSITORY:-exactlyone}"
SERVICE="${SERVICE:-exactlyone-web}"
TAG="${TAG:-$(git rev-parse --short HEAD)}"

gcloud services enable \
  artifactregistry.googleapis.com \
  cloudbuild.googleapis.com \
  run.googleapis.com \
  --project "$PROJECT_ID"

gcloud artifacts repositories describe "$REPOSITORY" \
  --location "$REGION" \
  --project "$PROJECT_ID" >/dev/null 2>&1 \
  || gcloud artifacts repositories create "$REPOSITORY" \
    --repository-format docker \
    --location "$REGION" \
    --project "$PROJECT_ID"

gcloud builds submit \
  --project "$PROJECT_ID" \
  --config cloudbuild.yaml \
  --substitutions "_REGION=$REGION,_REPOSITORY=$REPOSITORY,_SERVICE=$SERVICE,_TAG=$TAG"
