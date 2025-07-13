🏏 SQL Project: Cricket World Cup – Team Performance & Points Table
📌 Problem Statement
Given a table containing match-level results from a cricket World Cup, generate a team-wise performance summary that includes:

**Total Matches Played
Matches Won
Matches Lost
Points (2 per win)**

This analysis simulates a real-world tournament points table — useful in sports analytics and leaderboard tracking.

🧾 **Sample Dataset**

CREATE TABLE icc_world_cup (
  Team_1 VARCHAR(20),
  Team_2 VARCHAR(20),
  Winner VARCHAR(20)
);

INSERT INTO icc_world_cup VALUES 
('India','SL','India'),
('SL','Aus','Aus'),
('SA','Eng','Eng'),
('Eng','NZ','NZ'),
('Aus','India','India');

Each row represents one match:
Team_1 vs Team_2
Winner column stores the name of the winning team
