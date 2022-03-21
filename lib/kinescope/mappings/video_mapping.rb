# frozen_string_literal: true

module Kinescope
  class VideoMapping
    include Kartograph::DSL

    kartograph do
      mapping Video
      root_key plural: 'data', singular: 'data', scopes: [:read]

      property :id, scopes: [:read]
      property :project_id, scopes: [:read]
      property :folder_id, scopes: [:read]
      property :version, scopes: [:read]
      property :title, scopes: [:read]
      property :description, scopes: [:read]
      property :status, scopes: [:read]
      property :progress, scopes: [:read]
      property :duration, scopes: [:read]
      property :assets, scopes: [:read]
      property :chapters, scopes: [:read]
      property :privacy_type, scopes: [:read]
      property :privacy_domains, scopes: [:read]
      property :poster, scopes: [:read]
      property :additional_materials, scopes: [:read]
      property :additional_materials_enabled, scopes: [:read]
      property :created_at, scopes: [:read]
      property :updated_at, scopes: [:read]
      property :play_link, scopes: [:read]
      property :embed_link, scopes: [:read]
      property :subtitles, scopes: [:read]
      property :subtitles_enabled, scopes: [:read]
      property :hls_link, scopes: [:read]
    end
  end
end