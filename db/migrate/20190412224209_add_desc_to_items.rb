class AddDescToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :desc, :text
  end
end
