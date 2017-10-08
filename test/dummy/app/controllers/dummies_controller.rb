class DummiesController < ActionController::Base
  def result
  end

  def redirect
    flash.add_analytics_partial 'analytics/test_analytics_one'
    flash.add_analytics_partial 'analytics/test_analytics_two', local_value: "locals"

    redirect_to result_dummies_url
  end

  def render_now
    flash.add_analytics_partial 'analytics/test_analytics_one'
  end
end
