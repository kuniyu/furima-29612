# テーブル設計

## users テーブル

| Column          | Type   　| Options     |
| --------------- | ------ 　| ----------- |
| nickname        | string 　| null: false |
| email           | string 　| null: false |
| password        | string 　| null: false |
| last name       | string 　| null: false |
| last name kana  | string 　| null: false |
| first name      | string 　| null: false |
| first name kana | string　 | null: false |
| birthday        | integer　| null: false |

### Association

- has_many :items
- has_many :addresses
- has_many :purchase records

## items テーブル

| Column        | Type   　| Options     |
| ------------- | ------ 　| ----------- |
| product name  | string 　| null: false |
| image         | string 　| null: false |
| describe      | text 　  | null: false |
| category      | string 　| null: false |
| shipping fee  | string 　| null: false |
| shipfrom      | string 　| null: false |
| delivery time | string 　| null: false |
| price         | integer　| null: false |
| user_id       | integer　| null: false |

### Association

- belongs_to :users
- has_one :purchase records

## addresses テーブル

### Association

- belongs_to :users
- has_many :purchase records

| Column         | Type     | Options     |
| -------------- | -------  | ----------- |
| postal code    | integer  | null: false |
| prefectures    | string   | null: false |
| municipalities | string   | null: false |
| house number   | string   | null: false |
| phone number   | integer  | null: false |

## purchase records テーブル 

### Association

- belongs_to :users
- belongs_to :items

| Column         | Type     | Options     |
| -------------- | -------  | ----------- |
| user_id        | integer  | null: false |
| item name      | string   | null: false |
