# frozen_string_literal: true

module Kinescope
  class OrderMapping
    include Kartograph::DSL

    kartograph do
      mapping Order
      root_key plural: 'order', singular: 'order', scopes: [:read]

      property :created_at, scopes: [:read]
      property :title, scopes: [:read]
    end
  end

  class PaginationMapping
    include Kartograph::DSL

    kartograph do
      mapping Pagination
      root_key plural: 'pagination', singular: 'pagination', scopes: [:read]

      property :page, scopes: [:read]
      property :per_page, scopes: [:read]
      property :total, scopes: [:read]
    end
  end

  class MetaMapping
    include Kartograph::DSL

    kartograph do
      mapping Meta
      root_key plural: 'meta', singular: 'meta', scopes: [:read]

      property :order, include: OrderMapping, scopes: [:read]
      property :pagination, include: PaginationMapping, scopes: [:read]
    end
  end
end