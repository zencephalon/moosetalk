class CreateArticleTags < ActiveRecord::Migration
  def change
    create_table :article_tags do |t|
      t.references :article
      t.references :tag
    end
  end
end
