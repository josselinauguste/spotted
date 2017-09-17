# frozen_string_literal: true

require 'dry/auto_inject'

module Web
  class Services
    extend Dry::Container::Mixin
  end

  ImportServices = Dry::AutoInject(Services)
end
