DROP TABLE IF EXISTS login_session;
DROP TABLE IF EXISTS "user";

CREATE TABLE "user" (
    id_user SERIAL PRIMARY KEY,
    fullname VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    is_verified BOOLEAN NOT NULL DEFAULT FALSE,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE login (
    id_login SERIAL PRIMARY KEY,
    token VARCHAR(255) NOT NULL,
    status_login BOOLEAN NOT NULL DEFAULT TRUE,
    login_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    expiry_time TIMESTAMP,
    id_user INTEGER NOT NULL,
    CONSTRAINT fk_user FOREIGN KEY (id_user) REFERENCES "user"(id_user) ON DELETE CASCADE
);

CREATE INDEX idx_user_email ON "user"(email);
CREATE INDEX idx_login_id_user ON login(id_user);
CREATE INDEX idx_login_token ON