# Frima38555 テーブル設計

##　usersテーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | --------------------------|
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| nickname           | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| first_name_kana	   | string  | null: false               |
| last_name_kana     | string  | null: false               |
| birthday           | date    | null: false               |

###Association

- has_many : items
- has_many : purchases_informations

## itemsテーブル

| Column             | Type       | Options                       |
| -------------------| -----------| ----------------------------- |
| product_name       | string     | null: false                   |
| description        | text       | null: false                   |
| category_id        | integer    | null: false                   |
| condition_id       | integer    | null: false                   |
| price              | integer    | null: false                   |
| delivery_charge_id | integer    | null: false                   |
| prefecture_id      | integer    | null: false                   |
| delivery_period_id | integer    | null: false                   |
| user               | references | null: false,foreign_key: true | 
※imageはActiveStorageで実装する

###Association

- belongs_to :user(出品者)
- has_one: purchases_information

#extend ActiveHash::Associations::ActiveRecordExtensions
- belongs_to :category 
- belongs_to :condition 
- belongs_to :delivery_charge


## purchases_informationsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false,foreign_key: true  |
| item    | references | null: false, foreign_key: true |

###Association

- belongs_to : item
- belongs_to :user(購入者)
- has_one: address


## addressesテーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| purchases_information | references | null: false,foreign_key: true  |
| post_code             | string     | null: false                    |
| prefecture_id         | integer    | null: false                    |
| city                  | string     | null: false                    |
| house_number          | string     | null: false                    |
| building_name         | string     |                                |
| phone_number          | string     | null: false                    |

###Association

- belongs_to :purchases_information