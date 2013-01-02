Guard::Dsl.new.instance_eval do
  # Rerun bundler, if needed
  guard 'bundler' do watch /^(Gemfile|.*\.gemspec)$/ end

  # These reboot spork completely
  guard 'spork',
    minitest: true,
    test_unit: false,
    minitest_unit_env: { 'RAILS_ENV' => 'test' } do
    watch %r{config/(?:application|environment(?:s/test)?).rb}
    watch %r{^config/initializers/.+\.rb$}
    watch /Gemfile(?:\.lock)?/
    watch 'test/test_helper.rb' do :minitest end
  end

  guard 'sporkminitest' do
    watch %r|^test/.*_test\.rb|
    watch %r|^lib/(.*)\.rb| do |m| "test/#{m[1]}_test.rb" end
    watch %r|^test/test_helper\.rb| do 'test' end

    def controller_tests_for name
      %w(controllers functional integration).map do |subdir|
        "test/#{subdir}/#{name}_controller_test.rb"
      end
    end

    watch %r|^app/models/(.+).rb| do |m|
      plural = m[1]+'s' # TODO: proper Inflection
      [ "test/unit/#{m[1]}_test.rb" ] + controller_tests_for(plural)
    end

    watch %r(^app/controllers/(.+)_controller.rb) do |m|
      warn (controller_tests_for m[1]).inspect
      controller_tests_for m[1]
    end

    # Any app/ dir mapping directly parallel to test/* dirs:
    watch %r|^app/(.*)\.rb| do |m| "test/#{m[1]}_test.rb" end
  end
end
