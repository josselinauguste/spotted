# frozen_string_literal: true

$LOAD_PATH.unshift(__dir__)
$LOAD_PATH.unshift(File.expand_path(File.join(__dir__, 'lib')))

require 'sequel'
require 'sinatra'
