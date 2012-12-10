
require 'toto'

# Rack config
use Rack::Deflater
use Rack::Static, :urls => ['/css', '/js', '/img', '/favicon.ico'], :root => 'public'
use Rack::CommonLogger

if ENV['RACK_ENV'] == 'development'
	use Rack::ShowExceptions
end

#
# Create and configure a toto instance
#

toto = Toto::Server.new do
	#
	# Add your settings here
	# set [:setting], [value]
	# 
	# set :author,    ENV['USER']                               # blog author
	# set :title,     Dir.pwd.split('/').last                   # site title
	# set :root,      "index"                                   # page to load on /
	# set :date,      lambda {|now| now.strftime("%d/%m/%Y") }  # date format for articles
	# set :markdown,  :smart                                    # use markdown + smart-mode
	# set :disqus,    false                                     # disqus id, or false
	# set :summary,   :max => 150, :delim => /~/                # length of article summary and delimiter
	# set :ext,       'txt'                                     # file extension for articles
	# set :cache,      28800                                    # cache duration, in seconds
	# set :date, lambda {|now| now.strftime("%B #{now.day.ordinal} %Y") }

	set :author, "Max Ciotti"
	set :title, "Enigmatic Cryptography"
	set :desc, "Insight into the craft of <br/> covert communication"
	set :footer, "Design &copy; Max Ciotti<br/>Powered by <a href=\"http://cloudhead.io/toto\">toto</a>"
	set :markdown, :smart
	set :disqus, "enigmatic-cryptography"
	set :date, lambda {|now| now.strftime("%d %b %Y") }
	set :nav, [
		{:title => "All", :path => "/"},
		{:title => "Archives", :path => "/archives"},
		{:title => "About", :path => "/about"}
	]
	set :categories, ["Overview", "History", "Specifics", "Antisecurity", "Future"]
end

run toto
