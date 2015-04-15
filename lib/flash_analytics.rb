require 'flash_analytics/action_view_extensions'
require 'flash_analytics/flash_hash_extensions'
require 'flash_analytics/configuration'

module FlashAnalytics
end

ActionDispatch::Flash::FlashHash.send :prepend, FlashAnalytics::FlashHashExtensions
ActionView::Base.send :include, FlashAnalytics::ActionViewExtensions