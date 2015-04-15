module FlashAnalytics
  extend self

  def configure(&block)
    instance_eval(&block)
  end

  def active_environments
    @environments || "production"
  end

  def activate_for(environment:"production")
    @environments = [*environment.to_s]
  end
end