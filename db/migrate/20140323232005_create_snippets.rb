class CreateSnippets < ActiveRecord::Migration
  def change
    create_table :snippets do |t|
      t.string :name
      t.text :options
      t.integer :page_id
      t.timestamps
    end
  end
end
