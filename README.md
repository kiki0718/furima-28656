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

#テーブル設計

## users テーブル
| Column     | Type   | Options                  |
| ---------- | ------ | ------------------------ |
| nickname   | string | null: false, unique:true |
| mail       | string | null: false              |
| password   | string | null: false              |
| first_name | string | null: false              |
| last_name  | string | null: false              |
| nickname   | string | null: false              |

### Association
- has_many :items
- has_many :purchse_records
- has_many :adresses

## items テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| seller           | references | null: false, foreign_key: true |
| price            | string     | null: false                    |
| photo            | string     | null: false                    |
| category         | string     | null: false                    |
| status           | string     | null: false                    |
| delivery_fee     | string     | null: false                    |
| ship_from        | string     | null: false                    |
| ship_day         | string     | null: false                    |
| sales_commission | string     | null: false                    |
| sales_profit     | string     | null: false                    |
| description      | string     | null: false                    |

### Association
- belong_to :users
- has_one :purchse_records
- has_one :adresses

## purchse_records テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| buyer            | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |
| purchse_date     | string     | null: false                    |

### Association
- belongs_to :users
- belongs_to :items

## adresses テーブル
| Column | Type | Options |
| ------ | ---- | ------- |
| buyer            | references | null: false, foreign_key: true |
| postal_code      | string     | null: false                    |  
| prefecture       | string     | null: false                    |
| municipatities   | string     | null: false                    |  
| building_name    | string     |                                |
| house_number     | string     | null: false                    |
| phone_number     | string     | null: false                    |

### Association
- belongs_to :users
- belongs_to :items