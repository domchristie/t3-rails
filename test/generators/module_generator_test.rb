require 'test_helper'
require 'generators/t3/module_generator'

class ModuleGeneratorTest < Rails::Generators::TestCase
  tests T3::Generators::ModuleGenerator

  destination File.join(Rails.root, 'tmp')
  setup :prepare_destination

  test 'module file is created' do
    run_generator %w(cc_form)
    assert_file "#{install_path}/modules/cc_form.js", %r{addModule\('cc_form'}
  end

private

  def install_path
    'app/assets/javascripts'
  end

end
