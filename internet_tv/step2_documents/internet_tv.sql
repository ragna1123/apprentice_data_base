-- 以下internet_tv用SQLファイル
DROP DATABASE IF EXISTS internet_tv;
CREATE DATABASE IF NOT EXISTS internet_tv;
USE internet_tv;

DROP TABLE IF EXISTS channels,
                     programs,
                     time_tables,
                     episodes,
                     seasons,
                     genres,
                     episode_genre;

-- チャンネル (channels) テーブル
CREATE TABLE channels (
    channel_id INT NOT NULL AUTO_INCREMENT,
    channel_name VARCHAR(20) NOT NULL,
    PRIMARY KEY (channel_id),
    INDEX (channel_name)
);

-- 番組 (programs) テーブル
CREATE TABLE programs (
    program_id INT NOT NULL AUTO_INCREMENT,
    program_title VARCHAR(50) NOT NULL,
    program_detail TEXT,
    episode_id INT NOT NULL, -- エピソードテーブルの外部キー
    channel_id INT NOT NULL, -- チャンネルテーブルの外部キー
    PRIMARY KEY (program_id),
    INDEX (program_title),
    INDEX (program_id)
);

-- タイムテーブル (time_tables) テーブル
CREATE TABLE time_tables (
    timetable_id INT NOT NULL AUTO_INCREMENT,
    program_id INT NOT NULL, -- 番組テーブルの外部キー
    viewership_count INT NOT NULL,
    air_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL,
    channel_id INT NOT NULL, -- チャンネルテーブルの外部キー
    PRIMARY KEY (timetable_id),
    INDEX (program_id),
    INDEX (channel_id)
);

-- エピソード (episodes) テーブル
CREATE TABLE episodes (
    episode_id INT NOT NULL AUTO_INCREMENT,
    episode_title VARCHAR(50) NOT NULL,
    episode_number INT NOT NULL,
    episode_detail TEXT,
    video_duration TIME NOT NULL,
    release_date DATE,
    season_id INT NOT NULL, -- シーズンテーブルの外部キー
    PRIMARY KEY (episode_id),
    INDEX (episode_title),
    INDEX (episode_number),
    INDEX (season_id)
);

-- シーズン (seasons) テーブル
CREATE TABLE seasons (
    season_id INT NOT NULL AUTO_INCREMENT,
    season_title VARCHAR(20) NOT NULL,
    season_num VARCHAR(20),
    episode_total_num INT NOT NULL,
    PRIMARY KEY (season_id),
    INDEX (season_title),
    INDEX (season_num)
);

-- ジャンル (genres) テーブル
CREATE TABLE genres (
    genre_id INT NOT NULL AUTO_INCREMENT,
    genre_name VARCHAR(20) NOT NULL,
    PRIMARY KEY (genre_id),
    INDEX (genre_name)
);

-- エピソードとジャンルの中間テーブル (episode_genre) テーブル
CREATE TABLE episode_genre (
    episode_genre_id INT NOT NULL AUTO_INCREMENT,
    episode_id INT NOT NULL, -- エピソードテーブルの外部キー
    genre_id INT NOT NULL, -- ジャンルテーブルの外部キー
    PRIMARY KEY (episode_genre_id),
    INDEX (episode_id),
    INDEX (genre_id)
);

ALTER TABLE programs
    ADD FOREIGN KEY (episode_id) REFERENCES episodes(episode_id) ON DELETE CASCADE,
    ADD  FOREIGN KEY (channel_id) REFERENCES channels(channel_id) ON DELETE CASCADE;

ALTER TABLE time_tables
    ADD FOREIGN KEY (program_id) REFERENCES programs(program_id) ON DELETE CASCADE,
    ADD FOREIGN KEY (channel_id) REFERENCES channels(channel_id) ON DELETE CASCADE;

ALTER TABLE episodes
    ADD FOREIGN KEY (season_id) REFERENCES seasons(season_id) ON DELETE CASCADE;

ALTER TABLE episode_genre
    ADD FOREIGN KEY (episode_id) REFERENCES episodes(episode_id),
    ADD FOREIGN KEY (genre_id) REFERENCES genres(genre_id) ON DELETE CASCADE;

