# frozen_string_literal: true

require 'test_helper'
require 'album_fixtures'
require 'in_memory_album_repository'
require 'domain/repositories'
require 'domain/album'
require 'domain/album_service'

module Domain
  describe AlbumService do
    let(:albums) { AlbumFixtures.albums }
    let(:service) { AlbumService.new(album: InMemoryAlbumRepository.new(albums)) }

    it 'list existing albums' do
      result = service.list

      result.must_equal albums
    end
  end
end
