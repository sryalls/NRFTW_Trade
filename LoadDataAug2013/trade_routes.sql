LOCK TABLES `trade_routes` WRITE;
INSERT INTO `trade_routes` (market_1,market_2) VALUES
('Schattenberg','Chelm'),
('Chelm','Seraph'),
('Seraph','Krypte'),
('Krypte','Schattenberg'),
('Schattenberg','Varyaga'),
('Varyaga','Arboria');
UNLOCK TABLES;