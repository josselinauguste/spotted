# frozen_string_literal: true

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.libs << 'src'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
  t.warning = false
end
