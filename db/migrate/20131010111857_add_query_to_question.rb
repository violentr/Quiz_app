class AddQueryToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :query, :text
  end
end
