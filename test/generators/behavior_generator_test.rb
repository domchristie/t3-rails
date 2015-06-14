require 'test_helper'
require 'generators/t3/behavior_generator'

class BehaviorGeneratorTest < Rails::Generators::TestCase
  tests T3::Generators::BehaviorGenerator

  destination File.join(Rails.root, 'tmp')
  setup :prepare_destination

  test 'service file is created' do
    run_generator %w(validate)
    assert_file "#{install_path}/behaviors/validate.js", %r{addBehavior\('validate'}
  end

private

  def install_path
    'app/assets/javascripts'
  end

end
