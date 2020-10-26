# DB 設計


## users テーブル

| Column             | Type                | Options           |
|--------------------|---------------------|-------------------|
| email              | string              | null: false       |
| password           | string              | null: false       |
| name               | string              | null: false       |
| last_name          | string              | null: false       |
| first_name         | string              | null: false       |
| katakana_first     | string              | null: false       |
| last_katakana      | string              | null: false       |
| birthday           | datetime            | null: false       |
### Association

- has_many :items

## items テーブル

| Column                   | Type       | Options           |
|--------------------------|------------|-------------------|
| name                     | string     | null: false       |
| description              | string     | null: false       |
| category_id              | integer    | null: false       |
| condition_id             | integer    | null: false       |
| shipping_area_id         | integer    | null: false       |
| delivery_charges_id      | integer    | null: false       |
| selling_price            | integer    | null: false       |
| user                     | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_details

## purchase_details テーブル

| Column                  | Type       | Options            |
|-------------------------|------------|--------------------|
| user                    | references | foreign_key: true  |
| item                    | references | foreign_key: true  |

### Association

- belongs_to :item
- has_one :shipping_address

## shipping_address テーブル

| Column                  | Type       | Options            |
|-------------------------|------------|--------------------|
| postal_code             | string     | null: false        |
| prefecture_id           | string     | null: false        |
| municipality            | string     | null: false        |
| address                 | string     | null: false        |
| building_name           | string     |                    |
| phone_number            | integer    | null: false        |
| purchase_detail         | references | foreign_key: true  |

### Association 

- belongs_to :purchase_detail
