USE CSD430;

CREATE TABLE jasmine_states_data (
    state_id INT NOT NULL AUTO_INCREMENT,
    state_name VARCHAR(50) NOT NULL,
    abbreviation VARCHAR(2) NOT NULL,
    capital VARCHAR(50) NOT NULL,
    region VARCHAR(50) NOT NULL,
    population INT NOT NULL,
    PRIMARY KEY (state_id)
);