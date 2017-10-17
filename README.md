# Bloggable

## Setting Up Your Development Environment

1. Pull this repository
2. Install MySQL `brew install mysql`
3. Create a database `mysql -u root`, `CREATE DATABASE blog;`
4. Build `swift build -Xlinker -L/usr/local/lib`
5. Create tables `.build/debug/Bloggable createTable`
6. Run server `.build/debug/Bloggable runServer`
7. Visit http://localhost:8080
