# DB 設計


## users テーブル

| Column             | Type                | Options           |
|--------------------|---------------------|-------------------|
| email              | string              | null: false       |
| password           | string              | null: false       |
| nickname           | string              | null: false       |
| last_name          | string              | null: false       |
| first_name         | string              | null: false       |
| first_katakana     | string              | null: false       |
| last_katakana      | string              | null: false       |
| birthday           | date                | null: false       |

### Association

- has_many :items
- has_many :purchase_detail

## items テーブル

| Column                   | Type       | Options           |
|--------------------------|------------|-------------------|
| name                     | string     | null: false       |
| description              | text       | null: false       |
| category_id              | integer    | null: false       |
| condition_id             | integer    | null: false       |
| shipping_area_id         | integer    | null: false       |
| delivery_time_id         | integer    | null: false       |
| shipping_charge_id       | integer    | null: false       |
| selling_price            | integer    | null: false       |
| user                     | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_detail

## purchase_details テーブル

| Column                  | Type       | Options            |
|-------------------------|------------|--------------------|
| user                    | references | foreign_key: true  |
| item                    | references | foreign_key: true  |

### Association

- belongs_to :user 
- belongs_to :item
- has_one :shipping_address

## shipping_address テーブル

| Column                  | Type       | Options            |
|-------------------------|------------|--------------------|
| postal_code             | string     | null: false        |
| prefecture_id           | integer    | null: false        |
| municipality            | string     | null: false        |
| address                 | string     | null: false        |
| building_name           | string     |                    |
| phone_number            | string     | null: false        |
| purchase_detail         | references | foreign_key: true  |

### Association 

- belongs_to :purchase_detail
