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
| Column              | Type    | Options                  |
| ------------------- | ------- | ------------------------ |
| nickname            | string  | null: false|
| email               | string  | null: false              |
| encrypted_password  | string  | null: false              |
| first_name          | string  | null: false              |
| last_name           | string  | null: false              |
| first_name_furigana | string  | null: false              |
| last_name_furigana  | string  | null: false              |
| birthday            | date    | null: false              |

### Association
- has_many :items
- has_many :purchse_records

## items テーブル
| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| name                | string     | null: false                    |
| user                | references | null: false, foreign_key: true |
| price               | integer    | null: false                    |
| category_id         | integer    | null: false                    |
| status_id           | integer    | null: false                    |
| delivery_fee_id     | integer    | null: false                    |
| prefecture_id       | integer    | null: false                    |
| ship_day_id         | integer    | null: false                    |
| description         | text       | null: false                    |

### Association
- belongs_to :user
- has_one :purchse_record

## order テーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :adress

## adresses テーブル
| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| order_id          | references | null: false, foreign_key: true |
| postal_code       | string     | null: false                    |
| prefecture_id     | integer    | null: false                    |
| municipatities    | string     | null: false                    |
| building_name     | string     |                                |
| house_number      | string     | null: false                    |
| phone_number      | string     | null: false                    |

## Association
- belongs_to :purchse_record