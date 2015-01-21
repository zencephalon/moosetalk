class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user

  validates :user, presence: true
  validates :title, presence: true
  validates :content, presence: true

  has_many :replies, foreign_key: :parent_id, class_name: "Comment"
  belongs_to :parent, foreign_key: :parent_id, class_name: "Comment"
end