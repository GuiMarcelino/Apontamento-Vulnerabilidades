class AlterColumnsToHisotics < ActiveRecord::Migration[5.2]
  def change
    remove_column :historics, :historic_type, :integer
    add_column :historics, :updated_historic, :string

  end
end
