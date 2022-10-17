# Frima38555 テーブル設計

##　usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | --------------------------|
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| nickname           | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana	   | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

###Association

- has_many : items
- has_many : purchases_informations
 


## itemsテーブル

| Column            | Type       | Options                       |
| ------------------| -----------| ----------------------------- |
| 1.product_name    | string     | null: false                   |
| 2.description     | string     | null: false                   |
| 3.category        | string     | null: false                   |
| 4.condition       | string     | null: false                   |
| 5.price           | integer    | null: false                   |
| 6.delivery-charge | integer    | null: false                   |
| 7.ship_from       | string     | null: false                   |
| 8.delivery_period | integer    | null: false                   |
| 9.user            | references | null: false,foreign_key: true | 
※imageはActiveStorageで実装する

###Association

- belongs_to :user(出品者)
- has_one: purchases_information

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

###Association

- belongs_to :purchases_information