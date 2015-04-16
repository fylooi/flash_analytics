class DummiesController < ActionController::Base
  def test
    flash.add_analytics_partial 'analytics/test_analytics_one'
    flash.add_analytics_partial 'analytics/test_analytics_two', local_value: "locals"
  end
end