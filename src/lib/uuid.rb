# frozen_string_literal: true

require 'securerandom'
require 'dry-struct'

class UUID < Dry::Struct::Value
  include Dry::Types.module

  attribute :value, Strict::String

  def self.generate
    UUID.new(value: SecureRandom.uuid)
  end
end
