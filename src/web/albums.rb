# frozen_string_literal: true

require 'sinatra/base'
require 'domain/album_service'
require 'web/services'

module Web
  class Albums < Sinatra::Base
    include ImportServices['album_service']

    get '/' do
      albums = album_service.list

      erb :index, locals: { albums: albums }, layout: :app
    end
  end
end
