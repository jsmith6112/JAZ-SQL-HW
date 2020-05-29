CREATE TABLE seasons_stats (
  player_id INT,
  year DEC,
  position VARCHAR,
  age DEC,
  Tm VARCHAR,
  G VARCHAR,
  TS_Percentage DEC,
  FTr DEC,
  OWS DEC,
  DWS DEC,
  WS DEC,
  FG DEC,
  FGA DEC,
  FG_Percentage DEC,
  Two_Points DEC,
  Two_PA DEC,
  Two_Point_Percentage DEC,
  eFG_Percentage DEC,
  FT DEC,
  FTA DEC,
  FT_Percentage DEC,
  AST DEC,
  PF DEC,
  PTS DEC
);

Select * 
From players as p;

Select * 
From seasons_stats as s;

-- Perform an INNER JOIN on the two tables
SELECT 
	  	  players.id
		, players.player 
		, players.height 
		, players.weight
		, 
		, players.born
		, seasons_stats.position
		, seasons_stats.tm
		
FROM 	seasons_stats

INNER JOIN players ON
		players.id = seasons_stats.player_id;


Select
		  players.id
		, players.college
		, seasons_stats.year
		, seasons_stats.position
		, seasons_stats.two_point_percentage
		, seasons_stats.fg_percentage
		, seasons_stats.ft_percentage
		, seasons_stats.ts_percentage
From
		players
INNER JOIN seasons_stats ON
		players.id = seasons_stats.player_id;
		




