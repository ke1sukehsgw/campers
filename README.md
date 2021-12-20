# テーブル設計

## usersテーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |
| email  | string | null: false |

### Association

- has_many :tweets
- has_many :comments

## tweetsテーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| location_title | string     | null: false                    |
| text           | text       | null: false                    |
| user_id        | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments

## commentsテーブル

| Column       | Type       | Option                         |
| ------------ | ---------- | ------------------------------ |
| comment_text | text       | null: false                    |
| tweet_id     | references | null: false, foreign_key: true |
| user_id      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tweet