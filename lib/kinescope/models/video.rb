# frozen_string_literal: true

module Kinescope
  class Video < BaseModel
    attribute :id
    attribute :project_id
    attribute :folder_id
    attribute :version
    attribute :title
    attribute :description
    attribute :status
    attribute :progress
    attribute :duration
    attribute :assets
    attribute :chapters
    attribute :privacy_type
    attribute :privacy_domains
    attribute :poster
    attribute :additional_materials
    attribute :additional_materials_enabled
    attribute :created_at
    attribute :updated_at
    attribute :play_link
    attribute :embed_link
    attribute :subtitles
    attribute :subtitles_enabled
    attribute :hls_link

    def inspect
      variables = [:@id, :@project_id, :@folder_id, :@title].map { |name| [name, instance_variable_get(name)] }
      values = Hash[variables]
      "<#{self.class.name} #{values}>"
    end
  end
end