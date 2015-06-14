require 'test_helper'
require 'generators/t3/bootstrap_generator'

class BootstrapGeneratorTest < Rails::Generators::TestCase
  tests T3::Generators::BootstrapGenerator

  destination File.join(Rails.root, 'tmp')
  setup :prepare_destination

  def prepare_destination
    super
    assets_dir = "#{destination_root}/app/assets"
    mkdir_p assets_dir
    cp_r Rails.root.join('app', 'assets', 'javascripts'), assets_dir
  end

  test 'directories are created' do
    run_generator
    assert_directories
  end

  test '.gitkeep files are created' do
    run_generator
    assert_gitkeep_files
  end

  test '.gitkeep files are not created when skip_git option is true' do
    run_generator %w(-g)
    assert_no_gitkeep_files
  end

  test 'files are required in application.js' do
    run_generator
    assert_application_requires
  end

private

  def components
    %W{behaviors modules services}
  end

  def install_path
    'app/assets/javascripts'
  end

  def assert_directories(options = {})
    path = install_path
    components.each { |c| assert_directory "#{path}/#{c}" }
  end

  def assert_gitkeep_files(options={})
    path = install_path
    components.each { |c| assert_file "#{path}/#{c}/.gitkeep" }
  end

  def assert_no_gitkeep_files(options={})
    path = install_path
    components.each { |c| assert_no_file "#{path}/#{c}/.gitkeep" }
  end

  def assert_application_requires
    file = "#{install_path}/application.js"
    assert_file file

    # Ensure requires are not repeated
    absolute = File.expand_path(file, destination_root).shellescape
    assert_no_match %r{(^//= require t3$[^\z]+){2,}\z}, File.read(absolute)

    components.each do |c|
      assert_file file, %r{(//= require_tree ./#{c}){1}}
    end
  end

end
