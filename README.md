# DB 設計


## users テーブル

| Column             | Type                | Options           |
|--------------------|---------------------|-------------------|
| email              | string              | null: false       |
| password           | string              | null: false       |
| name               | string              | null: false       |
| last_name          | text                | null: false       |
| first_name         | text                | null: false       |
| katakana_first     | text                | null: false       |
| last_katakana      | text                | null: false       |
| birth_year         | integer             | null: false       | 
| birth_month        | integer             | null: false       |
| birth_day          | integer             | null: false       |

### Association

- has_many :items

## items テーブル

| Column                   | Type       | Options           |
|--------------------------|------------|-------------------|
| item_name                | text       | null: false       |
| item_description         | text       | null: false       |
| category_id              | integer    | null: false       |
| condition_id             | integer    | null: false       |
| shipping_area_id         | integer    | null: false       |
| delivery_charges_id      | integer    | null: false       |
| selling_price            | integer    | null: false       |
| user                     | references | foreign_key: true |

### Association

- belongs_to :user
- has_many :purchase_details

## purchase_details テーブル

| Column                  | Type       | Options            |
|-------------------------|------------|--------------------|
| credit_numbers          | integer    | null: false        |
| expiration_month        | integer    | null: false        |
| expiration_year         | integer    | null: false        |
| security_code           | integer    | null: false        |
| item                    | references | foreign_key: true  |

### Association

- belongs_to :items
- has_one :shipping_address

## shipping_address テーブル

| Column                  | Type       | Options            |
|-------------------------|------------|--------------------|
| postal_code             | integer    | null: false        |
| prefectures_id          | integer    | null: false        |
| municipality            | string     | null: false        |
| address                 | string     | null: false        |
| building_name           | string     |                    |
| phone_number            | integer    | null: false        |
| purchase_detail         | references | foreign_key: true  |

### Association 

- belongs_to :purchase_detail
