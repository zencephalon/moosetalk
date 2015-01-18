class Article < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  has_many :article_tags
  has_many :tags, through: :article_tags
  #belongs_to :user, foreign_key: :user_id
  #belongs_to :user, foreign_key: :author_id
  def parse_tags!(tags_str)
    self.tags.clear
    tags_str.split(',').map(&:strip).uniq.each do |tag_str|
      tag = Tag.where(name: tag_str).first_or_create
      self.tags << tag
    end
  end

  def tags_str
    self.tags.map(&:name).join(", ")
  end
end