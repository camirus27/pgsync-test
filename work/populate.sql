CREATE SCHEMA IF NOT EXISTS user_profile AUTHORIZATION postgres;

CREATE TABLE IF NOT EXISTS user_profile.user
(
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    invitation_code VARCHAR(100) UNIQUE NOT NULL,
    name VARCHAR(100) NOT NULL,
    surname VARCHAR(100),
    email VARCHAR(320) UNIQUE,
    phone VARCHAR(30) UNIQUE NOT NULL,
    profile_picture_url VARCHAR(255),
    audio_description_url VARCHAR(255),
    profile_picture_id VARCHAR(100),
    audio_description_id VARCHAR(100),
    age_range VARCHAR(255),
    website VARCHAR(255),
    auth_credential VARCHAR(255),
    signup_token_id VARCHAR(255),
    created_at TIMESTAMP(0) DEFAULT current_timestamp,
    updated_at TIMESTAMP(0),
    following BIGINT DEFAULT 0,
    followers BIGINT DEFAULT 0,
    version BIGINT DEFAULT 0
);
CREATE TABLE IF NOT EXISTS user_profile.content (
    id VARCHAR(255) NOT NULL PRIMARY KEY,
    created_by_user_id VARCHAR(255) NOT NULL,
    title VARCHAR(255) NOT NULL,
    description VARCHAR(255),
    categories VARCHAR(1024),
    type VARCHAR(255) NOT NULL,
    tags VARCHAR(1024),
    people VARCHAR(1024),
    location VARCHAR(255),
    saved BOOLEAN DEFAULT false,
    archived BOOLEAN DEFAULT false,
    expires_at TIMESTAMP(0),
    created_at TIMESTAMP(0) DEFAULT current_timestamp,
    updated_at TIMESTAMP(0),
    CONSTRAINT fk_user FOREIGN KEY(created_by_user_id) REFERENCES user_profile.user(id)
);

CREATE TABLE IF NOT EXISTS user_profile.test (
    id serial NOT NULL PRIMARY KEY,
    title VARCHAR(255) NOT NULL
);


