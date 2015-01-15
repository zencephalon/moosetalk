class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user

  validates :user, presence: true
  validates :title, presence: true
  validates :content, presence: true
end