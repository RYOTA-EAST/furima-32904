# テーブル設計

## Usersテーブル

|Column          |Type    |Options                   |
|----------------|--------|--------------------------|
|nickname        |string  |null: false, unique: true |
|email           |string  |null: false, unique: true |
|first_name      |string  |null: false               |
|last_name       |string  |null: false               |
|first_name_kana |string  |null: false               |
|last_name_kana  |string  |null: false               |
|birth_year      |integer |null: false               |
|birth_month     |integer |null: false               |
|birth_day       |integer |null: false               |

### Association
has_many :orders
has_many :items

## itemsテーブル

|Column          |Type          |Options                        |
|----------------|--------------|-------------------------------|
|image           |ActiveStorage |null: false                    |
|name            |string        |null: false                    |
|description     |string        |null: false                    |
|category        |string        |null: false                    |
|state           |string        |null: false                    |
|ship_pay        |integer       |null: false                    |
|ship_source     |integer       |null: false                    |
|ship_day        |integer       |null: false                    |
|price           |integer       |null: false                    |
|user            |references    |null: false, foreign_key: true |

### Association
belongs_to :user
has_one :order

## orderテーブル

|Column             |Type       |Options                        |
|-------------------|-----------|-------------------------------|
|card_number        |integer    |null: false                    |
|exp_month          |integer    |null: false                    |
|exp_year           |integer    |null: false                    |
|card_approval_code |integer    |null: false                    |
|user               |references |null: false, foreign_key: true |
|item               |references |null: false, foreign_key: true |

### Association
belongs_to :user
belongs_to :item
has_one :ship_address

## ship_addressesテーブル

|Column          |Type       |Options                        |
|----------------|-----------|-------------------------------|
|postal_code     |integer    |null: false                    |
|region          |string     |null: false                    |
|city            |string     |null: false                    |
|address         |string     |null: false                    |
|explosive       |string     |                               |
|phone_number    |string     |null: false                    |
|order           |references |null: false, foreign_key: true |

### Association
belongs_to :order