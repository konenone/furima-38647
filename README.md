## users テーブル

|Column        |Type   |Options     |
|--------------|-------|------------|
|nickname      |string |null: false |
|mail          |string |null: false |
|password      |string |null: false |
|firstname     |string |null: false |
|lastname      |string |null: false |
|firstname-kana|string |null: false |
|lastname-kana |string |null: false |
|birth-year    |integer|null: false |
|birth-month   |integer|null: false |
|birth-day     |integer|null: false |

### Association
has_many :purchase_records
has_many :items


## items テーブル

|Column             |Type       |Options                        |
|-------------------|-----------|-------------------------------|
|name               |string     |null: false                    |
|introduction       |text       |null: false                    |
|user_id            |references |null: false, foreign_key: true |
|category_id        |integer    |null: false                    |
|status_id          |integer    |null: false                    |
|shipping_charges_id|integer    |null: false                    |
|shipping_area_id   |integer    |null: false                    |
|days_to_ship_id    |integer    |null: false                    |

### Association
has_one :purchase_records


## purchase_records テーブル

|Column             |Type       |Options                        |
|-------------------|-----------|-------------------------------|
|user_id            |references |null: false, foreign_key: true |
|item_id            |references |null: false, foreign_key: true |

### Association
belongs_to :shipping_addresses


## shipping_addresses テーブル

|Column         |Type    |Options     |
|---------------|--------|------------|
|post_code      |integer |null: false |
|prefectures_id |integer |null: false |
|municipalities |text    |null: false |
|address        |text    |null: false |
|building_name  |text    |            |
|phone_number   |integer |null: false |


### Association




