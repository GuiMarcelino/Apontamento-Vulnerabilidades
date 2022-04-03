# frozen_string_literal: true

module API
  module Enums
    class PermissionModulesController < ::ApplicationController
      before_action :set_object, only: [:show]

      def index
        render_json_enum_collection(::PermissionModule)
      end

      def show
        render_json_enum(@object, 'permission_modules')
      end

      private

      def set_object
        select = ::PermissionModule.to_a.select { |x| x[1].to_s == params[:id] }
        raise ::ActiveRecord::RecordNotFound if select.blank?

        @object = select.first
      end
    end
  end
end