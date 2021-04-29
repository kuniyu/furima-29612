# テーブル設計

## users テーブル

| Column             | Type     | Options                  |
| ---------------    | ------   | -----------              |
| nickname           | string   | null: false              |
| email              | string   | null: false, unique true |
| encrypted_password | string   | null: false              |
| last_name          | string   | null: false              |
| last_name kana     | string   | null: false              |
| first_name         | string   | null: false              |
| first_name kana    | string   | null: false              |
| birthday           | date     | null: false              |


### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column           | Type     | Options                        |
| -------------    | ------   | ------------------------------ |
| product_name     | string   | null: false                    |
| describe         | text     | null: false                    |
| category_id      | integer  | null: false                    |
| condition_id     | integer  | null: false                    |
| shipping fee_id  | integer  | null: false                    |
| prefectures_id   | integer  | null: false                    |
| delivery time_id | integer  | null: false                    |
| price            | integer  | null: false                    |
| user_id          | integer  | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :purchase

## address テーブル

### Association

- belongs_to :purchase


| Column             | Type     | Options                        |
| ------------------ | -------  | ------------------------------ |
| postal_code        | string   | null: false                    |
| prefecture_id      | integer  | null: false                    |
| municipal          | string   | null: false                    |
| block_number       | string   | null: false                    |
| building_number    | string   |                                |
| phone_number       | string   | null: false                    |
| purchase_id        | integer  | null: false, foreign_key: true |

## purchase  テーブル 

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

| Column         | Type     | Options                        |
| -------------- | -------  | ------------------------------ |
| user_id        | integer  | null: false, foreign_key: true |
| item_id        | integer  | null: false, foreign_key: true |
