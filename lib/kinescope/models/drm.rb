# frozen_string_literal: true

module Kinescope
  class DRM < BaseModel
    attribute :url
    attribute :username
    attribute :password
    attribute :created_at
    attribute :updated_at
  end
end