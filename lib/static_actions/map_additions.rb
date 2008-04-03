module StaticActions
  module MapAdditions
    def static_actions(controller, actions)
      actions.each { |action| static_action(controller, action) }
    end
    
    def static_action(controller, action)
      if action.to_s == 'index'
        send("#{controller}_#{action}", "#{controller}", :controller => controller.to_s, :action => action.to_s)
        send("#{controller}_#{action}_with_format", "#{controller}.:format", :controller => controller.to_s, :action => action.to_s)
      else
        send("#{controller}_#{action}", "#{controller}/#{action}", :controller => controller.to_s, :action => action.to_s)
        send("#{controller}_#{action}_with_format", "#{controller}/#{action}.:format", :controller => controller.to_s, :action => action.to_s)
      end
    end
  end
end

class ActionController::Routing::RouteSet::Mapper
  include StaticActions::MapAdditions
end
