class AddParamsToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :title, :string
    add_column :articles, :author, :string
    add_column :articles, :source, :string
    add_column :articles, :description, :string
    add_column :articles, :url, :string
    add_column :articles, :image, :string
    add_column :articles, :pub_date, :string
    add_column :articles, :content, :string
  end
end
