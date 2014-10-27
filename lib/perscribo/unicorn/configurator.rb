# require 'perscribo/logger'
# require File.expand_path('../environment',  __FILE__)

# multilogger = ::Perscribo::MultiLogger.singleton_instance(::Rails.root, :unicorn)

# Configurator::DEFAULTS[:logger].formatter = proc { |*args| "" }

# before_exec do |server|
#   !!(server.app.logger = multilogger)
# end

# before_fork do |server, _|
#   server.stdout_path = server.stderr_path = '/dev/null'
#   !!(server.logger = multilogger)
# end

module Perscribo
  module Unicorn
    module Helpers
      module Configurator
        def capture!(base)

        end

        module_function :capture!
        public :capture!
      end
    end
  end
end
