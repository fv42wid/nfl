class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.integer :author_id
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
