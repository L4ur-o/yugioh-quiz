-- schema_and_questions.sql
-- Run this script on the `yugioh_quiz` database (do NOT include CREATE DATABASE here).

DROP TABLE IF EXISTS choice;
DROP TABLE IF EXISTS result;
DROP TABLE IF EXISTS question;

CREATE TABLE question (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  text TEXT NOT NULL,
  category VARCHAR(100),
  difficulty VARCHAR(50)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE choice (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  text TEXT NOT NULL,
  correct BOOLEAN NOT NULL DEFAULT FALSE,
  question_id BIGINT,
  CONSTRAINT fk_choice_question FOREIGN KEY (question_id) REFERENCES question(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE result (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  player_name VARCHAR(255),
  score INT,
  taken_at DATETIME
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Insert 20 questions and choices (English)
INSERT INTO question (text, category, difficulty) VALUES
('Who is the creator of the Yu-Gi-Oh! manga?', 'General', 'Easy'),
('What is the name of Yugi\'s grandfather?', 'Characters', 'Easy'),
('Which of these is an Egyptian God Card?', 'Cards', 'Medium'),
('What is the name of the tournament that Yugi participates in at the start of the series?', 'Plot', 'Easy'),
('Which card is considered Joey Wheeler\'s signature monster?', 'Characters', 'Easy'),
('Which card has the effect to destroy all Attack Position monsters when activated?', 'Cards', 'Easy'),
('Who is the villain that controls the Shadow Games in the Battle City arc?', 'Characters', 'Medium'),
('Which archetype centers around dragons and includes the Blue-Eyes White Dragon?', 'Cards', 'Easy'),
('Who often says the phrase "It\'s time to d-d-d-d-d-d-duel!"?', 'Meta', 'Easy'),
('What is the maximum number of copies of the same card allowed in a standard deck under classic rules?', 'Rules', 'Easy'),
('What monster type is Dark Magician categorized as?', 'Cards', 'Easy'),
('Where does the Duelist Kingdom tournament take place?', 'Plot', 'Medium'),
('Which card is used with Polymerization to perform a Fusion Summon?', 'Rules', 'Medium'),
('Who is the CEO of KaibaCorp?', 'Characters', 'Easy'),
('Which of these is Joey\'s notable card used frequently in duels?', 'Characters', 'Easy'),
('Who is the spirit that shares a body with Yugi and is often called the Pharaoh?', 'Characters', 'Easy'),
('Which card is known as "Magician of Black Chaos" associated with?', 'Cards', 'Medium'),
('Which card is Seto Kaiba\'s most famous monster?', 'Characters', 'Easy'),
('Which of these is NOT a typical card type?', 'Rules', 'Easy'),
('Which archetype includes "Dark Magician Girl"?', 'Cards', 'Medium');

-- Choices for each question (4 choices each). Mark the correct one as TRUE.
-- 1
INSERT INTO choice (text, correct, question_id) VALUES
('Kazuki Takahashi', TRUE, 1),
('Akira Toriyama', FALSE, 1),
('Masashi Kishimoto', FALSE, 1),
('Eiichiro Oda', FALSE, 1);

-- 2
INSERT INTO choice (text, correct, question_id) VALUES
('Solomon Muto', TRUE, 2),
('Seto Kaiba', FALSE, 2),
('Yami Marik', FALSE, 2),
('Maximillion Pegasus', FALSE, 2);

-- 3
INSERT INTO choice (text, correct, question_id) VALUES
('Slifer the Sky Dragon', TRUE, 3),
('Blue-Eyes White Dragon', FALSE, 3),
('Exodia the Forbidden One', FALSE, 3),
('Dark Magician', FALSE, 3);

-- 4
INSERT INTO choice (text, correct, question_id) VALUES
('Duelist Kingdom', TRUE, 4),
('Battle City', FALSE, 4),
('Silent Duel Arena', FALSE, 4),
('City of Duelists', FALSE, 4);

-- 5
INSERT INTO choice (text, correct, question_id) VALUES
('Red-Eyes Black Dragon', TRUE, 5),
('Blue-Eyes White Dragon', FALSE, 5),
('Dark Magician', FALSE, 5),
('Celtic Guardian', FALSE, 5);

-- 6
INSERT INTO choice (text, correct, question_id) VALUES
('Mirror Force', TRUE, 6),
('Raigeki', FALSE, 6),
('Harpie\'s Feather Duster', FALSE, 6),
('Torrential Tribute', FALSE, 6);

-- 7
INSERT INTO choice (text, correct, question_id) VALUES
('Maximillion Pegasus', FALSE, 7),
('Yami Marik', FALSE, 7),
('Marik Ishtar', TRUE, 7),
('Ishizu Ishtar', FALSE, 7);

-- 8
INSERT INTO choice (text, correct, question_id) VALUES
('Blue-Eyes archetype', TRUE, 8),
('Dark Magician archetype', FALSE, 8),
('Toon archetype', FALSE, 8),
('Elemental HERO archetype', FALSE, 8);

-- 9
INSERT INTO choice (text, correct, question_id) VALUES
('The show announcer', TRUE, 9),
('Yugi', FALSE, 9),
('Kaiba', FALSE, 9),
('Seto Kaiba\'s butler', FALSE, 9);

-- 10
INSERT INTO choice (text, correct, question_id) VALUES
('3', TRUE, 10),
('2', FALSE, 10),
('4', FALSE, 10),
('5', FALSE, 10);

-- 11
INSERT INTO choice (text, correct, question_id) VALUES
('Spellcaster', TRUE, 11),
('Dragon', FALSE, 11),
('Warrior', FALSE, 11),
('Fiend', FALSE, 11);

-- 12
INSERT INTO choice (text, correct, question_id) VALUES
('Duelist Kingdom island', TRUE, 12),
('Battle City', FALSE, 12),
('Silent Town', FALSE, 12),
('Rooftop Arena', FALSE, 12);

-- 13
INSERT INTO choice (text, correct, question_id) VALUES
('Fusion Summon', TRUE, 13),
('Ritual Summon', FALSE, 13),
('Tribute Summon', FALSE, 13),
('Synchro Summon', FALSE, 13);

-- 14
INSERT INTO choice (text, correct, question_id) VALUES
('Seto Kaiba', TRUE, 14),
('Maximillion Pegasus', FALSE, 14),
('Joey Wheeler', FALSE, 14),
('Yugi Muto', FALSE, 14);

-- 15
INSERT INTO choice (text, correct, question_id) VALUES
('Red-Eyes Black Dragon', TRUE, 15),
('Toon World', FALSE, 15),
('Time Wizard', FALSE, 15),
('Gemini Elf', FALSE, 15);

-- 16
INSERT INTO choice (text, correct, question_id) VALUES
('The Pharaoh (Yami Yugi)', TRUE, 16),
('Seto Kaiba', FALSE, 16),
('Maximillion Pegasus', FALSE, 16),
('Bakura', FALSE, 16);

-- 17
INSERT INTO choice (text, correct, question_id) VALUES
('Magician of Black Chaos', TRUE, 17),
('Blue-Eyes White Dragon', FALSE, 17),
('Summoned Skull', FALSE, 17),
('Dark Magician Girl', FALSE, 17);

-- 18
INSERT INTO choice (text, correct, question_id) VALUES
('Blue-Eyes White Dragon', TRUE, 18),
('Dark Magician', FALSE, 18),
('Summoned Skull', FALSE, 18),
('Red-Eyes Black Dragon', FALSE, 18);

-- 19
INSERT INTO choice (text, correct, question_id) VALUES
('Trap', FALSE, 19),
('Monster', TRUE, 19),
('Spell', FALSE, 19),
('Field', FALSE, 19);

-- 20
INSERT INTO choice (text, correct, question_id) VALUES
('Dark Magician Girl', TRUE, 20),
('Blue-Eyes White Dragon', FALSE, 20),
('Magician of Black Chaos', FALSE, 20),
('Toon Dark Magician Girl', FALSE, 20);

-- End of script
