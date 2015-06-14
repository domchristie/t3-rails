require 'generators/t3/generator_helper'

module T3
  module Generators
    class ModuleGenerator < ::Rails::Generators::NamedBase
      include T3::Generators::GeneratorHelper

      source_root File.expand_path("../../templates", __FILE__)

      desc 'Creates a new T3 module'

      def create_module_files
        create_component_files
      end
    end
  end
end
