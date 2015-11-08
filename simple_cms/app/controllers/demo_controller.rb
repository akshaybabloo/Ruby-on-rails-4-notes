class DemoController < ApplicationController

  layout false

  def index # this renders `index.html.erb`
    render(:template => 'demo/hello') # this will override `index.html.erb` and render `hello.html.erb` or this can also be written as `render('demo/hello')`
  end

  def hello # this renders `hello.html.erb`
  end
end
