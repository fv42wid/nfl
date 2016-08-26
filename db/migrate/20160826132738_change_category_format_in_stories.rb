class ChangeCategoryFormatInStories < ActiveRecord::Migration[5.0]
  def up
    remove_column :stories, :category
    add_column :stories, :category_id, :integer
  end

  def down
    remove_column :stories, :category_id
    add_column :stories, :category, :string
  end
end
