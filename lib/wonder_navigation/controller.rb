module WonderNavigation
  module Controller
    extend ActiveSupport::Concern
    
    included do
      before_action :set_default_wonder_navigation_page
      before_action :set_current_wonder_navigation_menu
    end

    def set_default_wonder_navigation_page
      page_action = case action_name.to_sym
                    when :create then :new
                    when :update then :edit
                    else action_name
                    end
      set_navigation_page "#{controller_path.tr('/','_')}_#{page_action}"
    end

    def set_current_wonder_navigation_menu(current_menu = :default)
      @current_menu = current_menu
    end

    def set_wonder_navigation_object(navigation_object)
      @navigation_object = navigation_object
    end

    def set_navigation_page(navigation_page)
      @navigation_page = navigation_page.to_sym
    end

  end
end
