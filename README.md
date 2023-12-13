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
| birth_day          | date    | null: false              |

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| item_name         | string     | null: false,                   |
| item_text         | text       | null: false,                   |
| category_id       | integer    | null: false,                   |
| condition_id      | integer    | null: false,                   |
| shippingfee_id    | integer    | null: false,                   |
| shippingregion_id | integer    | null: false,                   |
| shippingdate_id   | integer    | null: false,                   |
| price             | integer    | null: false,                   |
| user              | references | null: false, foreign_key: true |

## buys テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |


## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| buy            | references | null: false, foreign_key: true |
| postal_code    | string     | null: false,                   |
| prefectures_id | integer    | null: false,                   |
| city           | string     | null: false,                   |
| block          | string     | null: false,                   |
| buildings_name | string     |                                |
| phone_number   | string     | null: false,                   |
