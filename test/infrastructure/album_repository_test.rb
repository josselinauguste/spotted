# frozen_string_literal: true

require 'test_helper'
require 'mushroom'
require 'infrastructure/album_repository'

module Infrastructure
  describe AlbumRepository do
    let(:album) {
      {
        '_id' => UUID.generate.to_s,
        'name' => "Sign o' the Times",
        'release_date' => '1987-03-30',
        'artists' => [],
        'ambiances' => []
      }
    }
    let(:db) { Mushroom.fake.with_collection(:albums, [album]) }
    let(:repository) { AlbumRepository.new(db) }

    it 'load all albums from persistence' do
      albums = repository.all

      albums.wont_be_empty
    end
  end
end
