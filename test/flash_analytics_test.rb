require 'test_helper'

class FlashAnalyticsTest < ActiveSupport::TestCase
  test "truth" do
    assert_kind_of Module, FlashAnalytics
  end
end

class FlashHashTest < ActiveSupport::TestCase
  setup do
    @flash = ActionDispatch::Flash::FlashHash.new
    @flash.class_eval("prepend FlashAnalytics::FlashHashExtensions")
  end

  test "partial is successfully added to flash" do
    @flash.add_analytics_partial "partial_name"

    assert @flash.has_analytics?
  end

  test "flash_analytics are excluded from each" do
    @flash.add_analytics_partial "partial_name"
    @flash[:message] = "message"
    @flash[:alert] = "alert"
    results = []

    @flash.each { |k, v| results << k }

    assert results.length == 2
    assert_not results.include? 'flash_analytics'
  end
end

class DummiesControllerTest < ActionDispatch::IntegrationTest
  test "add_analytics_partial should render after redirect" do
    get redirect_dummies_url

    follow_redirect!
    assert_template :result
    assert_template partial: 'analytics/_test_analytics_one'
    assert_template partial: 'analytics/_test_analytics_two'
  end

  test "add_analytics_partial_now should render in the current request" do
    get render_now_dummies_url

    assert_template :render_now
    assert_template partial: 'analytics/_test_analytics_one'
  end
end
