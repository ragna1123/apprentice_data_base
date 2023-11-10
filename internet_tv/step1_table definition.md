<!-- テーブル定義書 -->

チャンネル (channels)
| カラム名       | データ型  | NULL  | キー | 初期値 | AUTO INCREMENT |
|----------------|----------|-------|-----|--------|-----------------|
| channel_id     | INT      |       | PK  |        | YES             |
| channel_name   | VARCHAR(20) |       | INDEX |        |                 |

番組 (programs)
| カラム名         | データ型  | NULL  | キー | 初期値 | AUTO INCREMENT |
|------------------|----------|-------|-----|--------|-----------------|
| program_id       | INT      |       | PK  |        | YES             |
| program_title    | VARCHAR(50) |       | INDEX |        |                 |
| program_detail   | TEXT     | YES   |     |        |                 |
| episode_id       | INT      |       | FK  |        |                 |

タイムテーブル (time_tables)
| カラム名         | データ型  | NULL  | キー | 初期値 | AUTO INCREMENT |
|------------------|----------|-------|-----|--------|-----------------|
| timetable_id    | INT      |       | PK  |        | YES             |
| program_id       | INT      |       | FK  |        |                 |
| viewership_count | INT      |       |     |        |                 |
| air_time         | DATETIME |       |     |        |                 |
| end_time         | DATETIME |       |     |        |                 |
| channel_id       | INT      |       | FK  |        |                 |

エピソード (episodes)
| カラム名           | データ型  | NULL  | キー | 初期値 | AUTO INCREMENT |
|--------------------|----------|-------|-----|--------|-----------------|
| episode_id         | INT      |       | PK  |        | YES             |
| episode_title      | VARCHAR(50) |       | INDEX |        |                 |
| episode_number     | INT      |       | INDEX |        |                 |
| episode_detail     | TEXT     | YES   |     |        |                 |
| video_duration     | TIME     |       |     |        |                 |
| release_date       | DATE     |       |     |        |                 |
| genre_id           | INT      | YES   | FK  |        |                 |
| season_id          | INT      | 　　   | FK  |        |                 |

シーズン (seasons)
| カラム名       | データ型  | NULL  | キー | 初期値 | AUTO INCREMENT |
|----------------|----------|-------|-----|--------|-----------------|
| season_id      | INT      |       | PK  |        | YES             |
| seasson_title  | VARCHAR(20)|     | INDEX |        |                 |
| season_num     | VARCHAR(20) | YES   | INDEX |        |                 |
| episode_total_num  | INT  |       |     |        | 1               |
| season_genres | INT       |       |     |        |                 |

ジャンル (genres)
| カラム名       | データ型  | NULL  | キー | 初期値 | AUTO INCREMENT |
|----------------|----------|-------|-----|--------|-----------------|
| genre_id       | INT      |       | PK  |        | YES             |
| genre_name     | VARCHAR(20) |       | INDEX |        |                 |


シーズンとジャンルの中間テーブル (season_genre)
| カラム名           | データ型  | NULL  | キー | 初期値 | AUTO INCREMENT |
|--------------------|----------|-------|-----|--------|-----------------|
| season_genre_id   | INT      |       | PK  |        | YES             |
| episode_id         | INT      |       | FK  |        |                 |
| genre_id           | INT      |       | FK  |        |                 |
