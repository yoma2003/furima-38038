# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| full_name          | string | null: false               |
| kana_name          | string | null: false               |
| date_of_birth      | date   | null: false               |

### Association

- has_many :items
- has_many :comments
- has_many :purchases

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| describe        | text       | null: false                    |
| category        | string     | null: false                    |
| condition       | integer    | null: false                    |
| delivery_charge | integer    | null: false                    |
| shipping_area   | string     | null: false                    |
| days_to_ship    | integer    | null: false                    |
| price           | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

- image保存はActiveStorageを使用

### Association

- belongs_to :user
- has_many :comments
- has_one :purchase

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | text       | null: false                    |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item

## purchases テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| card_number     | string     | null: false                    |
| expiration_date | string     | null: false                    |
| security_code   | integer    | null: false                    |
| post_code       | string     | null: false                    |
| address         | string     | null: false                    |
| phone_number    | string     | null: false                    |
| user_id         | references | null: false, foreign_key: true |
| item_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item