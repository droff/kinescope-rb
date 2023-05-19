# frozen_string_literal: true

module Kinescope
  class Project < BaseModel
    attribute :id
    attribute :name
    attribute :privacy_type
    attribute :privacy_domains
    attribute :player_id
    attribute :favorite
    attribute :size
    attribute :items_count
    attribute :created_at
    attribute :updated_at
    attribute :encrypted
  end
end