# Usage:
#
# flash.add 'google/home_page_pageview', user_name: @user.name

module FlashAnalytics
  module FlashHashExtensions
    def has_analytics?
      @flashes.key? "flash_analytics"
    end

    # stores the partial name and any local variables in the flash['flash_analytics'] hash
    # will be displayed on the next request
    def add_analytics_partial partial, *locals_hash
      self["flash_analytics"] ||= {}
      self["flash_analytics"][partial] = locals_hash[0]
    end
    
    # stores the partial name and any local variables in the flash['flash_analytics'] hash
    # will be displayed on the current request
    def add_analytics_partial_now partial, *locals_hash
      now["flash_analytics"] ||= {}
      now["flash_analytics"][partial] = locals_hash[0]
    end
    # exclude flash['analytics'] from flash.each display operations
    def each(&block)
      @flashes.reject {|k,v| k.to_s == "flash_analytics"}.each(&block)
    end
  end
end
