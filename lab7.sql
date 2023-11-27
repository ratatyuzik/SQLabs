DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    ip VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS news_categories;
CREATE TABLE news_categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS news;
CREATE TABLE news (
    id INT AUTO_INCREMENT PRIMARY KEY,
    category_id INT,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES news_categories(id)
);

DROP TABLE IF EXISTS comments;
CREATE TABLE comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    news_id INT,
    commenter_id INT,
    comment_text TEXT,
    FOREIGN KEY (news_id) REFERENCES news(id),
    FOREIGN KEY (commenter_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS ratings;
CREATE TABLE ratings (
    rating_id INT AUTO_INCREMENT PRIMARY KEY,
    news_id INT,
    user_id INT NOT NULL,
    rating_value INT CHECK (rating_value BETWEEN 1 AND 5),
    UNIQUE KEY (news_id, user_id),
    FOREIGN KEY (news_id) REFERENCES news(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);
