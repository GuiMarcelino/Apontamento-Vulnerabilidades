# frozen_string_literal: true

module Vulnerables
  class IndexSerializer < BaseSerializer

    attributes :name,
               :description,
               :solution,
               :level_type,
               :status_type,
               :created_by_id,
               :updated_by_id,
               :created_at,
               :updated_at

    def level_type
      {
        id: object.level_type,
        name: object.level_type_humanize
      }
    end

    def status_type
      {
        id: object.status_type,
        name: object.status_type_humanize
      }
    end
  end
end
