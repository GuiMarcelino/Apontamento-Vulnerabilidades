class AlterVulnerable < ActiveRecord::Migration[5.2]
  def change
    remove_column :vulnerables, :created_by_id
    remove_column :vulnerables, :updated_by_id

  end
end
