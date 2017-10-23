# frozen_string_literal: true

require 'domain/album'

module Infrastructure
  class AlbumMapper
    class ArtistMapper
      def map(attributes)
        Domain::Artist.new(
          name: attributes['name']
        )
      end
    end

    class AmbianceMapper
      def map(attributes)
        Domain::Ambiance.new(
          name: attributes['name']
        )
      end
    end

    def initialize(artist_mapper, ambiance_mapper)
      @artist_mapper = artist_mapper
      @ambiance_mapper = ambiance_mapper
    end

    def map(attributes)
      Domain::Album.new(
        id: UUID.new(value: attributes['_id']),
        name: attributes['name'],
        release_date: Date.parse(attributes['release_date']),
        artists: attributes['artists'].map { |artist| @artist_mapper.map(artist) },
        ambiances: attributes['ambiances'].map { |ambiance| @ambiance_mapper.map(ambiance) }
      )
    end
  end
end
