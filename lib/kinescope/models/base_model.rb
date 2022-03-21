# frozen_string_literal: true

require 'virtus'

module Kinescope
  class BaseModel
    include Virtus.model
    include Virtus::Equalizer.new(name || inspect)

    def inspect
      variables = instance_variables.map { |name| [name, instance_variable_get(name)] }
      values = Hash[variables]
      "<#{self.class.name} #{values}>"
    end
  end
end