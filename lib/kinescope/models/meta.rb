# frozen_string_literal: true

module Kinescope
  class Meta < BaseModel
    attribute :order
    attribute :pagination
  end

  class Order < BaseModel
    attribute :created_at
    attribute :title
  end

  class Pagination < BaseModel
    attribute :page
    attribute :per_page
    attribute :total
  end
end