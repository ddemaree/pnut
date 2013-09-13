Rails.application.config.tap do |config|
  config.generators do |g|
    # Wherever tests are generated, use RSpec
    g.test_framework :rspec
    g.integration_tool :rspec

    # Do not generate helpers
    g.helper false
    g.helper_specs false

    # Do not generate view specs
    g.view_specs false

    # Do not auto-generate asset files when generating controllers
    g.javascripts false
    g.stylesheets false
  end
end
