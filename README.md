# Baker Lab AI HUB

## Technology

- [Next.js](https://nextjs.org)

- [Prisma ORM](https://www.prisma.io/nextjs)


## Requirements

- Node v18

- MySQL / MariaDB database


## Installation

### With Docker

- Create `.env` file from `.env.example` and update the file content to have the following:

```
DATABASE_URL="mysql://bakerlab:password@db:3306/bakerlab"

# Next Auth Configuration
NEXTAUTH_URL="http://localhost:8080"
NEXTAUTH_SECRET="5f7e9a1c3b2d8f6e4a0d7c9b1a3f5e8d2c6b4a0"

# OpenAI Configuration
OPENAI_API_KEY="{replace_with_api_key}"

# Node Environment
NODE_ENV="dev"

# Docker Prefix
COMPOSE_PROJECT_NAME=bakerlab
```

- Create `.env_db` file from `.env_db.example`.

- Run the make command `make init-dev`

### Without Docker

- Vendor installation with `npm i`

- Create `.env` file from `.env.example` and update the file content to have the following:

```
DATABASE_URL="mysql://{replace_with_db_user}:{replace_with_db_password}@{replace_with_db_host}}:3306/{replace_with_db_name}"

# Next Auth Configuration
NEXTAUTH_URL="http://localhost:8080"
NEXTAUTH_SECRET="5f7e9a1c3b2d8f6e4a0d7c9b1a3f5e8d2c6b4a0"

# OpenAI Configuration
OPENAI_API_KEY="{replace_with_api_key}"

# Node Environment
NODE_ENV="dev"

# Docker Prefix
COMPOSE_PROJECT_NAME=bakerlab
```

- Apply database migrations(to create tables in db) with `npx prisma migrate deploy`

- Seed the database with `npx prisma db seed `

## Usage

### Run Project With Docker

- Run the command `make start-dev`

- Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

### Run Project Without Docker

- Run development server
```bash
npm run dev
```

- Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.


## Prisma

- To generate migration file

```bash
npx prisma migrate dev --name {migration_file_name}
```

- To deploy migration file on production

```bash
npx prisma migrate deploy
```

## Deploy

```bash
ssh user@195.15.223.35
cd /opt/Bakerlab-ai
sudo su
git pull
docker-compose build --no-cache
docker-compose up -d
```