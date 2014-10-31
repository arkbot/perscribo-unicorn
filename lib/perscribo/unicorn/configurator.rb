require 'perscribo/support/core/logging'

module Perscribo
  module Unicorn
    module Configurator
      using Support::Core::Dsl::ModuleRefinements

      def capture!(configurator_base)
        configurator_base.inside do
          lambda do
            logger = ::Perscribo::Support::Core::Logging::SingletonLogger["#{Dir.pwd}/tmp", :unicorn]

            ::Unicorn::Configurator::DEFAULTS[:logger].formatter = proc { |*args| "" }

            before_exec do |server|
              !!(server.app.logger = logger)
            end

            before_fork do |server, _|
              server.stdout_path = server.stderr_path = '/dev/null'
              !!(server.logger = logger)
            end
          end.call
        end
      end

      publish! :capture!
    end
  end
end
