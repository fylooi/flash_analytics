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

class DummiesControllerTest < ActionController::TestCase
  test "should get test" do
    get :test
    assert_template :test
    assert_template partial: 'analytics/_test_analytics_one'
    assert_template partial: 'analytics/_test_analytics_two'
  end
end