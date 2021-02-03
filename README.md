# テーブル設計

## users テーブル

| Column             | Type     | Options     |
| ---------------    | ------   | ----------- |
| nickname           | string   | null: false |
| email              | string   | null: false |
| encrypted_password | string   | null: false |
| last name          | string   | null: false |
| last name kana     | string   | null: false |
| first name         | string   | null: false |
| first name kana    | string   | null: false |
| birth year         | date     | null: false |
| birth month        | date     | null: false |
| date of birth      | date     | null: false |

### Association

- has_many :items
- has_many :addresses
- has_many :purchase records

## items テーブル

| Column           | Type     | Options     |
| -------------    | ------   | ----------- |
| product name     | string   | null: false |
| describe         | text     | null: false |
| category_id      | integer  | null: false |
| condition_id     | integer  | null: false |
| shipping fee_id  | integer  | null: false |
| shipfrom_id      | integer  | null: false |
| delivery time_id | integer  | null: false |
| price            | integer  | null: false |
| user_id          | integer  | null: false |

### Association

- belongs_to :users
- has_one :purchase records

## addresses テーブル

### Association

- belongs_to :purchase records


| Column         | Type     | Options     |
| -------------- | -------  | ----------- |
| postal code    | string  | null: false |
| shipfrom       | string   | null: false |
| municipalities | string   | null: false |
| house number   | string   | null: false |
| phone number   | string  | null: false |

## purchase records テーブル 

### Association


- belongs_to :items
- has_one :addresses

| Column         | Type     | Options     |
| -------------- | -------  | ----------- |
| user_id        | integer  | null: false |
| item_id        | integer  | null: false |
