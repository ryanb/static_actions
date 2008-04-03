module StaticActions
  module MapAdditions
    def static_actions(controller, actions)
      actions.each { |action| static_action(controller, action) }
    end
    
    def static_action(controller, action)
      path = (action.to_s == 'index' ? controller.to_s : "#{controller}/#{action}")
      send("#{controller}_#{action}", path, :controller => controller.to_s, :action => action.to_s)
      send("#{controller}_#{action}_with_format", "#{path}.:format", :controller => controller.to_s, :action => action.to_s)
    end
    
    def root_static_actions(controller, actions)
      actions.each { |action| root_static_action(controller, action) }
    end
    
    def root_static_action(controller, action)
      if action.to_s == 'index'
        root :controller => controller.to_s
      else
        send("#{action}", action.to_s, :controller => controller.to_s, :action => action.to_s)
        send("#{action}_with_format", "#{action.to_s}.:format", :controller => controller.to_s, :action => action.to_s)
      end
    end
  end
end

class ActionController::Routing::RouteSet::Mapper
  include StaticActions::MapAdditions
end
