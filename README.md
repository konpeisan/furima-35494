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

|  Column         |  Type    |  Options      |
| --------------- | -------- | ------------- |
|  nickname       |  string  |  null: false  |
|  email          |  string  |  null: false  |
|  password       |  string  |  null: false  |
|  name           |  string  |  null: false  |
|  date_of_birth  |  string  |  null: false  |

#  Association
- has_many :items
- has_many :comments
- has_one :buyer

## itemsテーブル

|  Column         |  Type        |  Options                        |
| --------------- | ------------ | ------------------------------- |
|  image          |  Active      |                                 |
|  items_name     |  string      |  null: false                    |
|  items_text     |  text        |  null: false                    |
|  category       |  string      |  null: false                    |
|  delivery       |  string      |  null: false                    |
|  price          |  string      |  null: false                    |
|  user_id        |  references  |  null: false, foreign_key: true |

# Association
- belongs_to :user
- has_many :comments
- has_one :buyer

## commentsテーブル

|  Column         |  Type        |  Options                        |
| --------------- | ------------ | ------------------------------- |
|  text           |  text        |  null: false                    |
|  item_id        |  references  |  null: false, foreign_key: true |
|  user_id        |  references  |  null: false, foreign_key: true |

# Association
- belongs_to :user
- belongs_to :item

## buyerテーブル

|  Column         |  Type        |  Options                        |
| --------------- | ------------ | ------------------------------- |
|  card           |  string      |  null: false                    |
|  phone          |  string      |  null: false                    |
|  address        |  string      |  null: false                    |
|  user_id        |  references  |  null: false, foreign_key: true |
|  item_id        |  references  |  null: false, foreign_key: true |

# Association

- belongs_to :user
- belongs_to :item
