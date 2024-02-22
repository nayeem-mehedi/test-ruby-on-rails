# My first Ruby-On-Rails API

> I explored Ruby on Rails to expand beyond my Java backend skills.
> This project helped me learn its fundamentals.

## Table of Contents

- [Project Overview](#project-overview)
- [Technologies Used](#technologies-used)
- [Project Setup](#project-setup)
- [Usage](#usage)

## Project Overview
This is simple CRUD api about articles.
I have also added one endpoint where I called an external api and prepared the response based on that. 

## Technologies Used
- ruby-on-rails
- httparty
- sqlite3
- puma

## Project Setup

Install all gems:
```bash
bundle install
```

Update the database with new data model:
```bash
rake db:migrate
```

Start the web server on http://localhost:3000 by default:
```bash
rails server
```

## Usage

base path : `/api/v1`

| HTTP method | Paths            |              Used for |
|-------------|------------------|----------------------:|
| POST        | /articles        |     Create an article |
| GET         | /articles/:id    | Show a single article |
| PUT         | /articles/:id    |     Update an article |
| DELETE      | /articles/:id    |     Delete an article |
| GET         | /crypto/:coin_id |         Create a post |
