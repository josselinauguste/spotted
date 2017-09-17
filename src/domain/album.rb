# frozen_string_literal: true

require 'dry-struct'
require 'lib/uuid'
require 'domain/ambiance'
require 'domain/artist'

module Domain
  class Album < Dry::Struct
    include Dry::Types.module
    constructor_type :strict_with_defaults

    attribute :id, UUID.default { UUID.generate }
    attribute :name, Strict::String
    attribute :artists, Strict::Array.of(Artist)
    attribute :release_date, Strict::Date
    attribute :ambiances, Strict::Array.of(Ambiance).default([])
  end
end
