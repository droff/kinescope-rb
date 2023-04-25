# frozen_string_literal: true

module Kinescope
  class VideoResource < ResourceKit::Resource
    include ErrorHandler

    resources do
      action :all, 'GET /v1/videos' do
        query_keys :page, :per_page, :project_id, :folder_id
        handler(200) { |response| VideoMapping.extract_collection(response.body, :read) }
      end
    end

    def all(*args)
      PaginationResource.new(action(:all), self, *args)
    end
  end
end