-- Table definitions for the tournament project.
--
-- Put your SQL 'create table' statements in this file; also 'create view'
-- statements if you choose to use it.
--
-- You can write comments in this file by starting them with two dashes, like
-- these lines here.

-- drop table players;
-- drop table matches;

create table if not exists players ( id SERIAL PRIMARY KEY, 
                       name VARCHAR(50) NOT NULL);

create table if not exists matches ( id SERIAL PRIMARY KEY,
                       winner INTEGER REFERENCES players,
                       loser INTEGER REFERENCES players);

create view winners as
    select players.id, players.name, count(matches.id) as wins
        from 
            players 
            left join matches 
                on matches.winner = players.id
        group by players.id;

create view losers as
    select players.id, players.name, count(matches.id) as loses
        from 
            players 
            left join matches 
                on matches.loser = players.id
        group by players.id;

create view matches_by_player as
    select players.id, players.name, count(matches.id) as matches
        from 
            players
            left join matches 
                on players.id = matches.winner or players.id = matches.loser
        group by players.id;

create view matches_winners as 
    select m.id, m.name, w.wins, m.matches 
        from 
            matches_by_player m 
            left join winners w 
                on m.id = w.id;

create view matches_losers as 
    select m.id, m.name, l.loses, m.matches 
        from 
            matches_by_player m 
            left join losers l 
                on m.id = l.id;

create view standings as
    select w.id, w.name, w.wins, w.matches 
        from 
            matches_winners w
            join matches_losers l
            on w.id = l.id
     order by w.wins desc;