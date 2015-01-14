class User < ActiveRecord::Base
  has_secure_password

  has_many :comments
  has_many :articles

  has_many :commented_articles, through: :comments, source: :article

  has_many :sent_messages, foreign_key: "sender_id", class_name: "Message"
  has_many :received_messages, foreign_key: "receiver_id", class_name: "Message"

  has_many :senders, through: :received_messages, source: :sender
  has_many :receivers, through: :sent_messages, source: :receiver
end