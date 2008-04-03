require File.dirname(__FILE__) + '/../spec_helper'

describe StaticActions::MapAdditions do
  before(:each) do
    @map = ActionController::Routing::RouteSet::Mapper.new(ActionController::Routing::RouteSet.new)
  end
  
  it "should respond to static_actions" do
    @map.should respond_to(:static_actions)
  end
  
  it "should call foo_bar on @map when passing foo as controller and bar as action" do
    @map.expects(:foo_bar).with('foo/bar', :controller => 'foo', :action => 'bar')
    @map.static_actions :foo, [:bar]
  end
end
