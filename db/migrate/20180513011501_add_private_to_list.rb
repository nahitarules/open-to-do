class AddPrivateToList < ActiveRecord::Migration
  def change
    add_column :lists, :private, :boolean
  end
end
