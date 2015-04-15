# Usage:
# in any view:
# render_analytics

module FlashAnalytics
  module ActionViewExtensions
    # concatenates all analytics partials and renders them as html or text (depending on environment)
    def render_analytics
      return unless flash.has_analytics?

      content = analytics_partial_content

      # only render as html for selected environments, else render as text within display:none div
      FlashAnalytics.active_environments.include?(Rails.env) ? raw(content) : raw('<div style="display:none">')+content+raw('</div>')
    end

    private

    def analytics_partial_content
      content = ""
      flash[:flash_analytics].each do |k, v|
        content += render partial: k, locals: v
      end
      content
    end
  end
end