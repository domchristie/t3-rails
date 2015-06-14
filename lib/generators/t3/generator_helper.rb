module T3
  module Generators
    module GeneratorHelper
    private

      def install_path
        'app/assets/javascripts'
      end

      def create_component_files
        generator_name = self.class.generator_name

        template "#{generator_name}.js",
          File.join(install_path, generator_name.pluralize, "#{file_path}.js")
      end

    end
  end
end