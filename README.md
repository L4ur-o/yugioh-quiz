# Yu-Gi-Oh Quiz (Styled) - Spring Boot + Thymeleaf + MySQL

This project is configured to connect to MySQL (manual DB creation).
DB configuration (src/main/resources/application.properties):
- URL: jdbc:mysql://localhost:3306/yugioh_quiz?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC
- username: root
- password: adminroot
- Important: set spring.jpa.hibernate.ddl-auto=none since schema is provided separately.

Steps to run:
1. Create database manually in MySQL:
   CREATE DATABASE yugioh_quiz CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
2. Run the provided SQL script `schema_and_questions.sql` against the `yugioh_quiz` database to create tables and insert 20 questions.
3. Open project in NetBeans 17 (File → Open Project) and run.
4. Access http://localhost:8080
