class AddReferencesToVulnerable < ActiveRecord::Migration[5.2]
  def change
    add_reference :vulnerables, :user, foreign_key: { to_table: :users }
  end
end
