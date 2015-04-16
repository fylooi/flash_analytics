
# render_analytics renders partials as html/js only in production by default.
# In other environments, partials will be rendered as escaped text wrapped in a hidden div block.
# Add environments to activate_for for partials to be rendered as html in those environments

FlashAnalytics.configure do
  # activate_for environment: [:production, :test, :development]
  activate_for environment: [:production]
end
