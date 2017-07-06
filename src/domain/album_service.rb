# frozen_string_literal: true

require 'domain/repositories'

module Domain
  class AlbumService
    include ImportRepositories['album']

    def list
      album.all.sort_by(&:name)
    end
  end
end
