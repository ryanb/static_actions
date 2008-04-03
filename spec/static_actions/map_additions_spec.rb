require File.dirname(__FILE__) + '/../spec_helper'

describe StaticActions::MapAdditions do
  before(:each) do
    @map = ActionController::Routing::RouteSet::Mapper.new(ActionController::Routing::RouteSet.new)
  end
  
  it "should respond to static_actions" do
    @map.should respond_to(:static_actions)
  end
end