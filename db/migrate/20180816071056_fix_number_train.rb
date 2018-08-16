class FixNumberTrain < ActiveRecord::Migration[5.2]
  def change
    change_column :trains,:number,:string
  end
end
