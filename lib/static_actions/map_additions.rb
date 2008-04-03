module StaticActions
  module MapAdditions
    def static_actions(controller, actions)
      actions.each do |action|
        send("#{controller}_#{action}", "#{controller}/#{action}", :controller => controller.to_s, :action => action.to_s)
      end
    end
  end
end

class ActionController::Routing::RouteSet::Mapper
  include StaticActions::MapAdditions
end
