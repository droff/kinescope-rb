# frozen_string_literal: true

module Kinescope
  class ProjectResource < ResourceKit::Resource
    include ErrorHandler

    resources do
      action :find, 'GET /v1/projects/:project_id' do
        handler(200) { |response| ProjectMapping.extract_single(response.body, :read) }
      end

      action :update, 'PUT /v1/projects/:project_id' do
        body { |object| ProjectMapping.representation_for(:update, object) }
        handler(200) { |response| ProjectMapping.extract_single(response.body, :read) }
      end
    end
  end
end