DROP TABLE IF EXISTS users;
CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS projects;
CREATE TABLE projects (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS users_projects;
CREATE TABLE users_projects (
    user_id INT,
    project_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (project_id) REFERENCES projects(id)
);

DROP TABLE IF EXISTS tasks;
CREATE TABLE tasks (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    author_id INT,
    project_id INT,
    FOREIGN KEY (author_id) REFERENCES users(id),
    FOREIGN KEY (project_id) REFERENCES projects(id)
);

DROP TABLE IF EXISTS task_executor;
CREATE TABLE task_executors (
    tasker_id INT,
    task_id INT,
    FOREIGN KEY (tasker_id) REFERENCES users(id),
    FOREIGN KEY (task_id) REFERENCES tasks(id)
);

DROP TABLE IF EXISTS files;
CREATE TABLE files (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    path VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS task_files;
CREATE TABLE task_files (
    file_id INT,
    task_id INT,
    FOREIGN KEY (file_id) REFERENCES files(id),
    FOREIGN KEY (task_id) REFERENCES tasks(id)
);
