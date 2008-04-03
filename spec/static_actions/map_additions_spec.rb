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
  
  it "should be able to pass multiple actions" do
    @map.expects(:foo_bar).with('foo/bar', :controller => 'foo', :action => 'bar')
    @map.expects(:foo_blah).with('foo/blah', :controller => 'foo', :action => 'blah')
    @map.static_actions :foo, [:bar, :blah]
  end
  
  it "should not display index action in path" do
    @map.expects(:foo_index).with('foo', :controller => 'foo', :action => 'index')
    @map.static_actions :foo, [:index]
  end
  
  it "should include format path for each action" do
    @map.expects(:foo_index_with_format).with('foo.:format', :controller => 'foo', :action => 'index')
    @map.expects(:foo_bar_with_format).with('foo/bar.:format', :controller => 'foo', :action => 'bar')
    @map.static_actions :foo, [:index, :bar]
  end
  
  it "should have a single static_action method which doesn't require an array" do
    @map.expects(:foo_bar).with('foo/bar', :controller => 'foo', :action => 'bar')
    @map.static_action :foo, :bar
  end
  
  it "should be able to make a root action which doesn't include controller name" do
    @map.expects(:bar).with('bar', :controller => 'foo', :action => 'bar')
    @map.expects(:bar_with_format).with('bar.:format', :controller => 'foo', :action => 'bar')
    @map.root_static_action :foo, :bar
  end
  
  it "should use root named route for index root action" do
    @map.expects(:root).with(:controller => 'foo')
    @map.root_static_action :foo, :index
  end
  
  it "should be able to specify multiple root actions" do
    @map.expects(:root).with(:controller => 'foo')
    @map.expects(:bar).with('bar', :controller => 'foo', :action => 'bar')
    @map.expects(:bar_with_format).with('bar.:format', :controller => 'foo', :action => 'bar')
    @map.root_static_actions :foo, [:index, :bar]
  end
end
