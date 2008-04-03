module StaticActions
  module MapAdditions
    def static_actions
      
    end
  end
end

class ActionController::Routing::RouteSet::Mapper
  include StaticActions::MapAdditions
end
