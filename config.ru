# Rack config
use Rack::Static, :urls => ['/css', '/js', '/img', '/favicon.ico'], :root => 'public'
use Rack::CommonLogger

require 'ruby_slippers'

#
# Create and configure a ruby-slippers instance
#
app = RubySlippers::Engine::App.new do
  log = File.new("slippers.log", "a+")
  $stdout.reopen(log)
  $stderr.reopen(log)
  
  #
  # Add your settings here
  # set [:setting], [value]
  # 
  set :author,      "Dreamr"                              # blog author
  set :title,       "RubySlippers, the smartest blog engine in all of Oz!"  # site title
  # set :root,      "index"                                   # page to load on /
  set :date,        lambda {|now| now.strftime("%m/%d/%Y") }    # date format for articles
  # set :markdown,  :smart                                    # use markdown + smart-mode
  # set :disqus,    false                                     # disqus id, or false
  set :summary,     :max => 680, :delim => /~/                # length of article summary and delimiter
  # set :ext,       'txt'                                     # file extension for articles
  # set :cache,      28800                                    # cache duration, in seconds
  set :tag_separator, ', '                                    # tag separator for articles
  set :date, lambda {|now| now.strftime("%B #{now.day.ordinal} %Y") }
  # set this to your local port. I use shotgun, so 9393.
  set :url, "http://localhost:9393" if ENV['RACK_ENV'] == 'development'
end

run app

