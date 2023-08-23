# frozen_string_literal: true

module Kinescope
  class ProjectMapping
    include Kartograph::DSL

    kartograph do
      mapping Project
      root_key plural: 'data', singular: 'data', scopes: [:read]

      property :id, scopes: [:read]
      property :name, scopes: [:read, :update]
      property :privacy_type, scopes: [:read, :update]
      property :privacy_domains, scopes: [:read]
      property :player_id, scopes: [:read]
      property :favorite, scopes: [:read]
      property :size, scopes: [:read]
      property :items_count, scopes: [:read]
      property :created_at, scopes: [:read]
      property :updated_at, scopes: [:read]
      property :encrypted, scopes: [:read, :update]
    end
  end
end