require 'perscribo/guard'

if defined? ::Rake::DSL
  module Perscribo
    module Support
      module Rake
        class UnicornTasks
          include ::Rake::DSL

          CONFIG_TEMPLATE = [
            "require 'perscribo/unicorn/configurator'",
            "::Perscribo::Unicorn::Configurator.capture!(self)"
          ].join("\n")

          def install_tasks
            namespace :perscribo do
              namespace :unicorn do
                desc 'Create default config/unicorn.rb hook for logging'
                task :hook_config do
                  Dir.mkdir('config') unless Dir.exists?('config')
                  File.open('config/unicorn.rb', 'a') do |f|
                    f.write("\n#{CONFIG_TEMPLATE}\n")
                  end
                  puts "Installed, require config/unicorn.rb to capture logging!"
                end
              end
            end
          end
        end
      end
    end
  end

  ::Perscribo::Support::Rake::UnicornTasks.new.install_tasks
end