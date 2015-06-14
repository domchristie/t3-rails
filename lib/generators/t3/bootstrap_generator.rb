require 'generators/t3/generator_helper'

module T3
  module Generators
    class BootstrapGenerator < ::Rails::Generators::Base
      include T3::Generators::GeneratorHelper

      desc 'Sets up T3 and default asset directories'
      class_option :skip_git, type: :boolean, aliases: '-g', default: false, desc: 'Do not create .gitkeep files'

      def create_directories
        components.each do |c|
          empty_directory "#{install_path}/#{c}"
          create_file "#{install_path}/#{c}/.gitkeep" unless options[:skip_git]
        end
      end

      def inject_t3
        requires = "//= require t3\n"

        requires += components.map { |dir|
          "//= require_tree ./#{dir}"
        }.join("\n") + "\n"

        inject_into_file "#{install_path}/application.js", requires,
          before: '//= require_tree .'

        # If //= require_tree . does not exist, inject at the bottom
        # (Thor ensures that the content is not injected more than once)
        inject_into_file "#{install_path}/application.js", requires,
          before: %r{\z}
      end

    private

      def components
        %W{behaviors modules services}
      end

    end
  end
end
