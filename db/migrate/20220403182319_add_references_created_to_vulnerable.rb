class AddReferencesCreatedToVulnerable < ActiveRecord::Migration[5.2]
  def change
    add_reference :vulnerables, :created_by, foreign_key: { to_table: :users }
    add_reference :vulnerables, :updated_by, foreign_key: { to_table: :users }
  end
end
