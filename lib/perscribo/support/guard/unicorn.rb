require 'perscribo/guard'

module Perscribo
  module Support
    module Guard
      module Unicorn
        OUT_PATH = "#{Dir.pwd}/tmp/perscribo_unicorn_#{ENV['RACK_ENV']}.log"
        DEFAULTS = {
          labels: [:debug, :info, :warn, :error, :fatal, :unknown],
          guard_opts: { },
          path: OUT_PATH,
          watcher_opts: { }
        }

        ::Perscribo::Guard.capture!(self)
      end
    end
  end
end
