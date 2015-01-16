class Article < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  has_many :article_tags
  has_many :tags, through: :article_tags
  #belongs_to :user, foreign_key: :user_id
  #belongs_to :user, foreign_key: :author_id
end