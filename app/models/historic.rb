class Historic < ApplicationRecord
  belongs_to :user


  before_save :generate_log, on: %i[create update]

  def generate_log

    user.historics.create(
      created_by_id: created_by_id,
      created_at: created_at,
      updated_at: updated_at,
      historic_type: historic_type_humanize,

    )
  end
end