# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/around/spec'
require 'timecop'
require 'rack/test'

src_path = File.join(File.dirname(__FILE__), '..', 'src')
$LOAD_PATH.unshift(File.expand_path(src_path))

Timecop.safe_mode = true
