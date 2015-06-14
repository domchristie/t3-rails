require 'test_helper'
require 'generators/t3/service_generator'

class ServiceGeneratorTest < Rails::Generators::TestCase
  tests T3::Generators::ServiceGenerator

  destination File.join(Rails.root, 'tmp')
  setup :prepare_destination

  test 'service file is created' do
    run_generator %w(credit_card)
    assert_file "#{install_path}/services/credit_card.js", %r{addService\('credit_card'}
  end

private

  def install_path
    'app/assets/javascripts'
  end

end
