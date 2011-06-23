require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'ruby_slippers'
require './lib/ruby_slippers/client/tasks'

task :default => :new

namespace :test do
  TEST_TYPES = %w(integration)
  TEST_TYPES.each do |type|
    Rake::TestTask.new(type) do |test|
      test.libs << 'lib' << 'test'
      test.pattern = "test/#{type}/*_test.rb"
      test.verbose = true
    end
  end
  
  Rake::TestTask.new(:all) do |test|
    test.libs << 'lib' << 'test'
    test.pattern = 'test/integration/*_test.rb'
    test.verbose = true
  end
end
task :test => 'test:all'

desc "Install my blog."
task :install do
  tasks = RubySlippers::Client::Tasks.new
  tasks.install_blog!
end

desc "Create a new article."
task :new do
  tasks = RubySlippers::Client::Tasks.new
  tasks.create_article!
end

desc "Publish my blog."
task :publish do
  tasks = RubySlippers::Client::Tasks.new
  tasks.publish_blog!
end

