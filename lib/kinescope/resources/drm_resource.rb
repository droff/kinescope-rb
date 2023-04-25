# frozen_string_literal: true

module Kinescope
  class DRMResource < ResourceKit::Resource
    include ErrorHandler

    resources do
      action :find, 'GET /v1/drm/auth/:project_id' do
        handler(200) { |response| DRMMapping.extract_single(response.body, :read) }
      end

      action :update, 'PUT /v1/drm/auth/:project_id' do
        body { |object| DRMMapping.representation_for(:update, object) }
        handler(200) { |response| DRMMapping.extract_single(response.body, :read) }
      end

      action :delete, 'DELETE /v1/drm/auth/:project_id' do
        handler(200) { true }
      end
    end
  end
end