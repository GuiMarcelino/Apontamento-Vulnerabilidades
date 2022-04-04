class Historic < ApplicationRecord
  belongs_to :user

  def generate_log
    user.historics.create(
      description: description,
      created_by_id: created_by_id,
      record_date_historic: Time.now,
      historic_marketing_type: historic_marketing_type,
      record_id: id

    )
  end
end