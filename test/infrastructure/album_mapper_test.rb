# frozen_string_literal: true

require 'test_helper'
require 'securerandom'
require 'domain/album'
require 'infrastructure/album_mapper'

module Infrastructure
  describe AlbumMapper do
    let(:mapper) { AlbumMapper.new(AlbumMapper::ArtistMapper.new, AlbumMapper::AmbianceMapper.new) }

    it 'map a hash to a domain object' do
      attributes = {
        '_id' => SecureRandom.uuid,
        'name' => "Sign o' the Times",
        'release_date' => '1987-03-30',
        'artists' => [{ 'name' => 'Prince' }],
        'ambiances' => [{ 'name' => 'funky' }]
      }

      album = mapper.map(attributes)

      album.must_be_kind_of Domain::Album
      album.id.must_equal UUID.new(value: attributes['_id'])
      album.name.must_equal attributes['name']
      album.release_date.must_equal Date.parse(attributes['release_date'])
      album.artists.wont_be_empty
      album.artists.first.must_be_kind_of Domain::Artist
      album.artists.first.name.must_equal attributes['artists'].first['name']
      album.ambiances.wont_be_empty
      album.ambiances.first.must_be_kind_of Domain::Ambiance
      album.ambiances.first.name.must_equal attributes['ambiances'].first['name']
    end
  end
end
