class GsubHook < ActiveRecord::Migration
  def change
    add_column :snippets, :gsub_hook, :string
  end
end
