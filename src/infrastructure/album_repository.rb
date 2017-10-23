# frozen_string_literal: true

require 'infrastructure/album_mapper'

module Infrastructure
  class AlbumRepository
    def initialize(db)
      @collection = db[:albums]
      @mapper = AlbumMapper.new(AlbumMapper::ArtistMapper.new, AlbumMapper::AmbianceMapper.new)
    end

    def all
      @collection.find.map { |r| @mapper.map(r) }
    end
  end
end
