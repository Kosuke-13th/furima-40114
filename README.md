# テーブル設計

## users テーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| nickname           | string  | null: false,             |
| email              | string  | null: false, unique: true|
| encrypted_password | string  | null: false              |
| last_name          | string  | null: false              |
| first_name         | string  | null: false              |
| last_name_kana     | string  | null: false              |
| first_name_kana    | string  | null: false              |
| birthday_year      | integer | null: false              |
| birthday_month     | integer | null: false              |
| birthday_date      | integer | null: false              |

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false,                   |
| item_text       | text       | null: false,                   |
| item_category   | string     | null: false,                   |
| item_condition  | string     | null: false,                   |
| shipping_fee    | string     | null: false,                   |
| shipping_region | string     | null: false,                   |
| shipping_date   | string     | null: false,                   |
| price           | integer    | null: false,                   |
| user            | references | null: false, foreign_key: true |

## buys テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |


## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| buy            | references | null: false, foreign_key: true |
| postal_code    | integer    | null: false,                   |
| prefectures    | string     | null: false,                   |
| city           | string     | null: false,                   |
| block          | string     | null: false,                   |
| buildings_name | string     |                                |
| phone_number   | integer    | null: false,                   |
