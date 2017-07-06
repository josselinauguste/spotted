# frozen_string_literal: true

require 'dry/auto_inject'

module Domain
  class Repositories
    extend Dry::Container::Mixin
  end

  ImportRepositories = Dry::AutoInject(Repositories)
end
