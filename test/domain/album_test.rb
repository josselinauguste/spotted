# frozen_string_literal: true

require 'test_helper'
require 'domain/album'
require 'domain/album_service'

module Domain
  describe Album do
    let(:default_attributes) do
      {
        name: "Sign o' the Times",
        release_date: Date.parse('1987-03-30'),
        artists: [Artist.new(name: 'Prince')]
      }
    end

    it 'create new album with default values' do
      album = Album.new(default_attributes)

      album.id.wont_be_nil
      album.name.must_equal default_attributes[:name]
      album.release_date.must_equal default_attributes[:release_date]
      album.artists.must_equal default_attributes[:artists]
      album.ambiances.must_be_empty
    end

    describe 'create new album without compulsory values fails' do
      it 'without name' do
        attributes = default_attributes.dup
        attributes.delete(:name)

        assert_raises Dry::Struct::Error do
          Album.new(attributes)
        end
      end

      it 'without release date' do
        attributes = default_attributes.dup
        attributes.delete(:release_date)

        assert_raises Dry::Struct::Error do
          Album.new(attributes)
        end
      end

      it 'without artist' do
        attributes = default_attributes.dup
        attributes.delete(:artists)

        assert_raises Dry::Struct::Error do
          Album.new(attributes)
        end
      end
    end
  end
end
