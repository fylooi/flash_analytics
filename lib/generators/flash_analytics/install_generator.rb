class FlashAnalytics::InstallGenerator < Rails::Generators::Base
  source_root(File.expand_path(File.dirname(__FILE__)))

  def copy_initializer
    copy_file 'flash_analytics.rb', 'config/initializers/flash_analytics.rb'
  end
end