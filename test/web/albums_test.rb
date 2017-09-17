# frozen_string_literal: true

require 'test_helper'
require 'cgi'
require 'album_fixtures'
require 'web/albums'

module Web
  describe Albums do
    include Rack::Test::Methods
    include AlbumFixtures

    let(:album) { AlbumFixtures.album }
    let(:albums) { AlbumFixtures.albums }
    let(:app) { Web::Albums.new(album_service: StubAlbumService.new(albums)) }

    it 'renders all albums' do
      get '/'

      last_response.body.must_match /Sign o. the Times/
    end

    class StubAlbumService
      def initialize(albums)
        @albums = albums
      end

      def list
        albums
      end
    end
  end
end
