# frozen_string_literal: true

$LOAD_PATH.unshift(__dir__)
$LOAD_PATH.unshift(File.expand_path(File.join(__dir__, 'lib')))

require 'mongo'
require 'sinatra'
require 'infrastructure/album_repository'
require 'web/albums'

MONGO_CLIENT = Mongo::Client.new('mongodb://127.0.0.1:27017/spotted')

Domain::Repositories.register(:album, Infrastructure::AlbumRepository.new(MONGO_CLIENT))
Web::Services.register(:album_service, Domain::AlbumService.new)

use Web::Albums
