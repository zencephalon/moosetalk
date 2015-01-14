class User < ActiveRecord::Base
  has_secure_password

  has_many :comments
  has_many :articles

  has_many :commented_articles, through: :comments, source: :article

end