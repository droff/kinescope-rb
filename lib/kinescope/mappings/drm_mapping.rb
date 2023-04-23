# frozen_string_literal: true

module Kinescope
  class DRMMapping
    include Kartograph::DSL

    kartograph do
      mapping DRM
      root_key plural: 'data', singular: 'data', scopes: [:read]

      property :url, scopes: [:read, :update]
      property :username, scopes: [:read, :update]
      property :password, scopes: [:read, :update]
      property :created_at, scopes: [:read]
      property :updated_at, scopes: [:read]
    end
  end
end