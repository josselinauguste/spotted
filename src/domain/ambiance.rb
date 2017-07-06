# frozen_string_literal: true

require 'dry-struct'

module Domain
  class Ambiance < Dry::Struct::Value
    include Dry::Types.module

    attribute :name, Strict::String
  end
end
