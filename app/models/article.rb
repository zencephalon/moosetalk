class Article < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  #belongs_to :user, foreign_key: :user_id
  #belongs_to :user, foreign_key: :author_id
end