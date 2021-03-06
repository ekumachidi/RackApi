require_relative 'file_logger'
require_relative 'api_key'
require_relative 'validate_content_type'
require_relative 'who_is_calling'

require_relative 'application_helpers'
require_relative 'users_application'
require_relative 'rides_application'

require_relative 'database'

if ENV['RACK_ENV'] == 'production'
	use Rack::NullLogger
	use Rack::CommonLogger
else
	use Rack::Logger
	use Rack::Reloader
end
use ApiKey
use ValidateContentType
use WhoIsCalling

map('/users') do
  run UsersApplication.new
end

map('/rides') do
  run RidesApplication.new
end
