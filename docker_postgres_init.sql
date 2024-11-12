-- Create user and database if not already existing
CREATE USER priyank WITH PASSWORD 'priyank';
CREATE DATABASE sample_db OWNER priyank;
GRANT ALL PRIVILEGES ON DATABASE sample_db TO priyank;
