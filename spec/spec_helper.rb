require "simplecov"
require "coveralls"
SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
SimpleCov.start { add_filter "/spec/" }

require "lita-cleverbot"
require "lita/rspec"

Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each {|f| require f }

# A compatibility mode is provided for older plugins upgrading from Lita 3. Since this plugin
# was generated with Lita 4, the compatibility mode should be left disabled.
Lita.version_3_compatibility_mode = false

Lita.configure do |config|
  config.handlers.cleverbot.api_user = 'apiuser'
  config.handlers.cleverbot.api_key = 'apikey'
end
