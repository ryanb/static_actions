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
  end
end

class ActionController::Routing::RouteSet::Mapper
  include StaticActions::MapAdditions
end
