-- Create Teams table
CREATE TABLE teams (
    team_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    founded_year INT
);

-- Create Players table
CREATE TABLE players (
    player_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    position VARCHAR(50),
    team_id INT REFERENCES teams(team_id)
);

-- Create Referees table
CREATE TABLE referees (
    referee_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    experience_years INT
);

-- Create Matches table
CREATE TABLE matches (
    match_id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    home_team_id INT REFERENCES teams(team_id),
    away_team_id INT REFERENCES teams(team_id),
    referee_id INT REFERENCES referees(referee_id),
    season_id INT REFERENCES seasons(season_id)
);

-- Create Goals table
CREATE TABLE goals (
    goal_id SERIAL PRIMARY KEY,
    player_id INT REFERENCES players(player_id),
    match_id INT REFERENCES matches(match_id),
    time_scored TIME NOT NULL
);

-- Create Seasons table
CREATE TABLE seasons (
    season_id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL
);

-- Create Standings table
CREATE TABLE standings (
    standing_id SERIAL PRIMARY KEY,
    team_id INT REFERENCES teams(team_id),
    season_id INT REFERENCES seasons(season_id),
    points INT,
    matches_played INT,
    wins INT,
    losses INT,
    draws INT
);
