# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## usersテーブル

|  Column             |  Type    |  Options                                |
| ------------------- | -------- | --------------------------------------- |
|  nickname           |  string  |  null: false                            |
|  email              |  string  |  null: false, default: "",unique: true  |
|  encrypted_password |  string  |  null: false, default: ""               |
|  last_name          |  string  |  null: false                            |
|  first_name         |  string  |  null: false                            |
|  last_name_kana     |  string  |  null: false                            |
|  first_name_kana    |  string  |  null: false                            |
|  birthday           |  date    |  null: false                            |

#  Association
- has_many :items
- has_many :comments
- has_many :histories

## itemsテーブル

|  Column          |  Type        |  Options                        |
| ---------------- | ------------ | ------------------------------- |
|  items_name      |  string      |  null: false                    |
|  items_text      |  text        |  null: false                    |
|  category_id     |  integer     |  null: false                    |
|  status_id       |  integer     |  null: false                    |
|  delivery_id     |  integer     |  null: false                    |
|  area_id         |  integer     |  null: false                    |
|  shopping_day_id |  integer     |  null: false                    |
|  price           |  integer     |  null: false                    |
|  user            |  references  |  null: false, foreign_key: true |

# Association
- belongs_to :user
- has_many :comments
- has_one :history

## commentsテーブル

|  Column         |  Type        |  Options                        |
| --------------- | ------------ | ------------------------------- |
|  text           |  text        |  null: false                    |
|  item           |  references  |  null: false, foreign_key: true |
|  user           |  references  |  null: false, foreign_key: true |

# Association
- belongs_to :user
- belongs_to :item

## ordersテーブル

|  Column         |  Type        |  Options                        |
| --------------- | ------------ | ------------------------------- |
|  postal_code    |  string      |  null: false                    |
|  area_id        |  integer     |  null: false                    |
|  municipality   |  string      |  null: false                    |
|  address        |  string      |  null: false                    |
|  building       |  string      |                                 |
|  phone          |  string      |  null: false                    |
|  history        |  references  |  null: false, foreign_key: true |

# Association
- belongs_to :history

## historiesテーブル

|  Column         |  Type        |  Options                        |
| --------------- | ------------ | ------------------------------- |
|  item           |  references  |  null: false, foreign_key: true |
|  user           |  references  |  null: false, foreign_key: true |

# Association
- belongs_to :user
- belongs_to :item
- has_one :order