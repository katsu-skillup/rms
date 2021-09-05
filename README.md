# README

# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| name               | string | null: false               |


### Association

- has_many :members
- has_one :meeting

## members テーブル

| Column        | Type       | Options                        |
| --------------| ---------- | ------------------------------ |
| member_name   | string     | null: false                    |
| organization  | string     | null: false                    |
| position      | string     | null: false                    |
| work_info     | text       | null: false                    |
| valuation_id  | integer    | null: false                    |
| communication | integer    | null: false                    |
| leadership    | integer    | null: false                    |
| skill         | integer    | null: false                    |
| motivation    | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :meetings

## meetings テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| meeting_date | date       | null: false                    |
| meeting_info | text       | null: false                    |
| member       | references | null: false, foreign_key: true |
| user         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :member

