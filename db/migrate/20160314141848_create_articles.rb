class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :post
      t.integer :person_id
      t.references :person, polymorphic: true, index: true
      t.timestamps null: false
    end

  end
end
