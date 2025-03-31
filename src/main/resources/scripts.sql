CREATE TABLE users (
                       username VARCHAR(50) NOT NULL PRIMARY KEY,
                       password VARCHAR(500) NOT NULL,
                       enabled BOOLEAN NOT NULL
);

CREATE TABLE authorities (
                             username VARCHAR(50) NOT NULL,
                             authority VARCHAR(50) NOT NULL,
                             CONSTRAINT fk_authorities_users FOREIGN KEY (username) REFERENCES users (username),
                             UNIQUE (username, authority)
);

-- Use ON CONFLICT DO NOTHING to mimic INSERT IGNORE
INSERT INTO users (username, password, enabled)
VALUES ('user', '{noop}EazyBytes@12345', TRUE)
    ON CONFLICT (username) DO NOTHING;

INSERT INTO authorities (username, authority)
VALUES ('user', 'read')
    ON CONFLICT (username, authority) DO NOTHING;

INSERT INTO users (username, password, enabled)
VALUES ('admin', '{bcrypt}$2a$12$88.f6upbBvy0okEa7OfHFuorV29qeK.sVbB9VQ6J6dWM1bW6Qef8m', TRUE)
    ON CONFLICT (username) DO NOTHING;

INSERT INTO authorities (username, authority)
VALUES ('admin', 'admin')
    ON CONFLICT (username, authority) DO NOTHING;

CREATE TABLE customer (
                          id SERIAL PRIMARY KEY,
                          email VARCHAR(45) NOT NULL,
                          pwd VARCHAR(200) NOT NULL,
                          role VARCHAR(45) NOT NULL
);

INSERT INTO customer (email, pwd, role)
VALUES ('happy@example.com', '{noop}EazyBytes@12345', 'read');

INSERT INTO customer (email, pwd, role)
VALUES ('admin@example.com', '{bcrypt}$2a$12$88.f6upbBvy0okEa7OfHFuorV29qeK.sVbB9VQ6J6dWM1bW6Qef8m', 'admin');

CREATE TABLE authorities (
                             id SERIAL PRIMARY KEY,
                             customer_id INT NOT NULL,
                             name VARCHAR(50) NOT NULL,
                             CONSTRAINT authorities_customer_fk FOREIGN KEY (customer_id) REFERENCES customer (customer_id)
);
