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

|  Column             |  Type    |  Options                   |
| ------------------- | -------- | -------------------------- |
|  nickname           |  string  |  null: false               |
|  email              |  string  |  null: false, default: ""  |
|  encrypted_password |  string  |  null: false, default: ""  |
|  last_name          |  string  |  null: false               |
|  first_name         |  string  |  null: false               |
|  last_name_kana     |  string  |  null: false               |
|  first_name         |  string  |  null: false               |
|  birthday           |  date    |  null: false               |

#  Association
- has_many :items
- has_many :comments
- has_one :buyer
- has_many :history

## itemsテーブル

|  Column         |  Type        |  Options                        |
| --------------- | ------------ | ------------------------------- |
|  items_name     |  string      |  null: false                    |
|  items_text     |  text        |  null: false                    |
|  category_id    |  integer     |  null: false                    |
|  status         |  integer     |  null: false                    |
|  delivery       |  integer     |  null: false                    |
|  area           |  integer     |  null: false                    |
|  day            |  integer     |  null: false                    |
|  price          |  integer     |  null: false                    |
|  user_id        |  references  |  null: false, foreign_key: true |

# Association
- belongs_to :user
- has_many :comments
- has_one :buyer

## commentsテーブル

|  Column         |  Type        |  Options                        |
| --------------- | ------------ | ------------------------------- |
|  text           |  text        |  null: false                    |
|  item           |  references  |  null: false, foreign_key: true |
|  user           |  references  |  null: false, foreign_key: true |

# Association
- belongs_to :user
- belongs_to :item

## buyerテーブル

|  Column         |  Type        |  Options                        |
| --------------- | ------------ | ------------------------------- |
|  postal_code    |  string      |  null: false                    |
|  prefectures    |  string      |  null: false                    |
|  municipality   |  string      |  null: false                    |
|  address        |  string      |  null: false                    |
|  building       |  string      |  null: false                    |
|  phone          |  string      |  null: false                    |
|  user           |  references  |  null: false, foreign_key: true |
|  item           |  references  |  null: false, foreign_key: true |

# Association
- belongs_to :user
- belongs_to :item
- has_many :history

## historyテーブル

|  Column         |  Type        |  Options                        |
| --------------- | ------------ | ------------------------------- |
|  price          |  integer     |  null: false                    |
|  items_name     |  string      |  null: false                    |
|  purchase_date  |  string      |  null: false                    |
|  user           |  references  |  null: false, foreign_key: true |

# Association
- belongs_to :user
- belongs_to :buyer