class AddCorrectnessToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :correctness, :boolean
  end
end
