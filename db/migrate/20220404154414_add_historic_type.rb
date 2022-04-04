class AddHistoricType < ActiveRecord::Migration[5.2]
  def change
    add_column :historics, :historic_type, :integer
  end
end
