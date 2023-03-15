## users テーブル

|Column              |Type   |Options                 |
|--------------------|-------|------------------------|
|nickname            |string |null: false             |
|email               |string |null: false ,unique:true|
|encrypted_password  |string |null: false             |
|firstname           |string |null: false             |
|lastname            |string |null: false             |
|firstname_kana      |string |null: false             |
|lastname_kana       |string |null: false             |
|birthday            |date   |null: false             |


### Association
has_many :purchase_records
has_many :items


## items テーブル

|Column             |Type       |Options                        |
|-------------------|-----------|-------------------------------|
|name               |string     |null: false                    |
|introduction       |text       |null: false                    |
|user               |references |null: false, foreign_key: true |
|category_id        |integer    |null: false                    |
|status_id          |integer    |null: false                    |
|shipping_charges_id|integer    |null: false                    |
|shipping_area_id   |integer    |null: false                    |
|days_to_ship_id    |integer    |null: false                    |
|price              |integer    |null: false                    |

### Association
has_one :purchase_record


## purchase_records テーブル

|Column          |Type       |Options                        |
|----------------|-----------|-------------------------------|
|user            |references |null: false, foreign_key: true |
|item            |references |null: false, foreign_key: true |

### Association
has_one :shipping_address
has_one :item
belongs_to :user

## shipping_addresses テーブル

|Column          |Type      |Options                       |
|----------------|----------|------------------------------|
|post_code       |string    |null: false                   |
|shipping_area_id|integer   |null: false                   |
|municipalities  |string    |null: false                   |
|address         |string    |null: false                   |
|building_name   |string    |                              |
|phone_number    |string    |null: false                   |
|purchase_record |references|null: false, foreign_key: true| 

### Association
has_one :purchase_record


