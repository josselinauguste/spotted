# frozen_string_literal: true

require 'domain/album'

module AlbumFixtures
  def self.album
    Domain::Album.new(
      id: UUID.generate,
      name: "Sign o' the Times",
      release_date: Date.parse('1987-03-30'),
      artists: [],
      ambiances: []
    )
  end

  def self.albums
    [
      album
    ]
  end
end
