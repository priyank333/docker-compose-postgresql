Here's a `README.md` file to explain the purpose of your `docker-compose.yml` setup and how to execute it.

```markdown
# PostgreSQL and pgAdmin Setup with Docker Compose

This setup provides a quick way to deploy a PostgreSQL database along with pgAdmin, a popular database management tool, using Docker Compose. This guide will explain what each component does and how to execute the setup.

## Components

- **PostgreSQL**: A powerful, open-source relational database system.
- **pgAdmin**: A web-based GUI for managing PostgreSQL databases.

The Docker Compose file will set up a PostgreSQL instance and a pgAdmin container that connects to it, making it easy to view and manage your PostgreSQL database in a web browser.

## Files

1. **`docker-compose.yml`**: Defines the services, including PostgreSQL and pgAdmin, and their configurations.
2. **`docker_postgres_init.sql`**: SQL script to initialize the PostgreSQL database with a user and database.
3. **`.env`**: Environment variables for PostgreSQL and pgAdmin configuration.

## Setup Instructions

### Prerequisites

- Ensure Docker and Docker Compose are installed on your machine.
- Make sure the `.env` file contains the correct environment variables, as described below.

### Environment Variables

Create a `.env` file in the same directory as the `docker-compose.yml` with the following variables:

```plaintext
# Database configuration
POSTGRES_USER=postgres
POSTGRES_PASSWORD=postgres
POSTGRES_DB=postgres

# pgAdmin configuration
PGADMIN_DEFAULT_EMAIL=postgres@example.com
PGADMIN_DEFAULT_PASSWORD=postgres
```

### docker-compose.yml Overview

The `docker-compose.yml` file specifies two services:

- **postgres**: 
  - Uses the `postgres:latest` image.
  - Configured with user, password, and database from `.env` file.
  - Exposes port `5432` to allow connections.
  - Loads the `docker_postgres_init.sql` file to initialize the database.

- **pgadmin**:
  - Uses the `dpage/pgadmin4:latest` image.
  - Configured with default email and password from `.env` file.
  - Exposes port `16543` for accessing pgAdmin in the browser.

### Initialization Script

The `docker_postgres_init.sql` file is run when the PostgreSQL container starts. It will:

- Create a user `priyank` with password `priyank`.
- Create a database `sample_db` owned by `priyank`.
- Grant all privileges on `sample_db` to `priyank`.

## Running the Setup

To start the PostgreSQL and pgAdmin services, run the following command in the directory containing `docker-compose.yml`:

```bash
docker-compose up -d
```

The `-d` flag runs the services in detached mode (in the background).

## Accessing pgAdmin

Once the containers are running:

1. Open a browser and go to [http://localhost:16543](http://localhost:16543).
2. Log in using the credentials specified in the `.env` file:
   - **Email**: `postgres@example.com`
   - **Password**: `postgres`
3. In pgAdmin, you can connect to the PostgreSQL database using the following details:
   - **Host**: `postgres`
   - **Port**: `5432`
   - **Username**: `priyank`
   - **Password**: `priyank`
   - **Database**: `sample_db`

## Stopping the Services

To stop the running services, use:

```bash
docker-compose down
```

This will stop and remove the containers.

## Troubleshooting

- Ensure Docker is running and accessible from your command line.
- Check that ports `5432` and `16543` are not in use by other services on your machine.

## Notes

- The PostgreSQL and pgAdmin images are set to restart automatically (`restart: always`), which helps maintain uptime.
- The `docker_postgres_init.sql` script will only run the first time the PostgreSQL container is created.

## License

This setup is open-source and can be modified as needed.
```

Save this as `README.md` in the same directory as your `docker-compose.yml` file.