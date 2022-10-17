# Frima38555 テーブル設計

##　usersテーブル

| Column             | Type   | Options                |
| ------------------ | ------ | -----------------------|
| email              | string | null: false ユニーク制約 |
| encrypted_password | string | null: false            |
| nickname           | string | null: false            |
| first-name         | string | null: false            |
| last-name          | string | null: false            |
| birthday           | string | null: false            |

###Association

- has_many : items
- has_one : purchases information



## itemsテーブル

| Column            | Type       | Options                       |
| ------------------| -----------| ----------------------------- |
| 1.product-name    | string     | null: false                   |
| 2.description     | string     | null: false                   |
| 3.category        | string     | null: false                   |
| 4.condition       | string     | null: false                   |
| 5.price           | integer    | null: false                   |
| 6.delivery-charge | integer    | null: false                   |
| 7.ship-from       | string     | null: false                   |
| 8.delivery-period | integer    | null: false                   |
| 9.user_id         | references | null: false,foreign_key: true | 
※imageはActiveStorageで実装する

###Association

- belongs_to :user(出品者)
- has_one: purchases information

## purchases informationテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user_id    | references | null: false,foreign_key: true  |
| item_id    | references | null: false, foreign_key: true |
| address_id | references | null: false, foreign_key: true |

###Association

- belongs_to : item
- belongs_to :user(購入者)
- has_one: address
