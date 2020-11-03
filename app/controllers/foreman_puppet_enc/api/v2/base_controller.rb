module ForemanPuppetEnc
  module Api
    module V2
      class BaseController < ::Api::V2::BaseController
        resource_description do
          api_version '2'
          api_base_url '/foreman_puppet_enc/api'
        end

        before_action :show_deprecation_for_core_routes

        protected

        def show_deprecation_for_core_routes
          return if request.path.starts_with?('/foreman_puppet_enc')
          Foreman::Deprecation.api_deprecation_warning(
            format(
              '/api/v2/%{controller} API endpoints are deprecated, please use /foreman_puppet_enc/api/v2/%{controller} instead',
              controller: controller_name
            )
          )
        end
      end
    end
  end
end
