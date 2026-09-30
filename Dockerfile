FROM node:26

RUN npm install -g pnpm@12.6.0

WORKDIR /app

COPY app/package.json app/pnpm-lock.yaml app/pnpm-workspace.yaml ./
RUN pnpm install --frozen-lockfile
