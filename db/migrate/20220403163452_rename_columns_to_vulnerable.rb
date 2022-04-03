class RenameColumnsToVulnerable < ActiveRecord::Migration[5.2]
  def change
     rename_column :vulnerables, :level, :level_type
     rename_column :vulnerables, :status, :status_type
     rename_column :vulnerables, :nome, :name

  end
end
