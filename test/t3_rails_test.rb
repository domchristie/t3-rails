require 'test_helper'

class T3RailsTest < ActiveSupport::TestCase
  def setup
    @app = Dummy::Application
  end

  test 't3 is found as an asset' do
    assert_not_nil @app.assets['t3']
    assert_not_nil @app.assets['t3.min']
    assert_not_nil @app.assets['t3-testing']
  end
end
