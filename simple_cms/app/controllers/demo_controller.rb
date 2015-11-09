class DemoController < ApplicationController

  layout false

  def index # this renders `index.html.erb`
    # render(:template => 'demo/hello') # this will override `index.html.erb` and render `hello.html.erb` or this can also be written as `render('demo/hello')`
  end

  def hello # this renders `hello.html.erb`
    @array = [1,2,3,4,5,6]
    @id = params['id']
    @page = params[:page]
  end

  def other_hello
    redirect_to(:controller => 'demo', :action => 'index')
  end

  def google
    redirect_to('http://www.google.com')
  end
end
