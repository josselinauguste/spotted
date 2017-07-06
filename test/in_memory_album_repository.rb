# frozen_string_literal: true

class InMemoryAlbumRepository
  attr_reader :all

  def initialize(albums)
    @all = albums
  end
end
