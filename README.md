# Ruby on Rails 4 Notes

## 1. Requirements

### 1.1 Mac

1. Edit .bash_profile
2. Xcode and command line tools (gcc -v to conform)
3. Homebrew
4. Ruby virtual environment (rbenv)
5. Ruby
6. RubyGems
7. Ruby on Rails
8. MySQL
9. Web server

## 2 Instillation

### 2.1 Step 1: Editing .bash_profile

* Open terminal and type `cd ~`, the type `nano .bash_profile`.
* This will open nano editor with your .bash_profile file. In this file type in the following

<pre>
# MySQL
export PATH="/usr/local/mysql/bin:$PATH"

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
</pre>

* Save the file with `ctrl + x` and `y` for yes.

### 2.2 Step 2: Install XCode and command line tools

* Open App store and search for XCode. Click on Install to install the software.  
* Once the software is installed, open the software then go to `XCode -> Preference`. Goto `Download` tab and download the Command line tools

### 2.3 Step 3: Installing Homebrew

Go to [Homebrew](http://brew.sh/) website and follow the instillation procedure

### 2.4 Step 4: Installing Ruby virtual environment (rbenv)

Open terminal and type `brew update` to update the list of available software. Then type `brew install rbenv`.

### 2.5 Step 5: Installing Ruby

OSX comes preinstalled Ruby 2. To check what version you are using type `ruby -v` in terminal. But we would be using virtual environment to install the latest version of Ruby and Rails. Do the following:

1. Goto [Ruby download page](https://www.ruby-lang.org/en/downloads/) and check the current stable Ruby version number. At the time of this tutorial the stable version was `2.2.3`. Now, to install ruby in a virtual environment type `rbenv install 2.2.3` in your terminal.
2. Once Ruby is installed you would have to rehash the virtual environment by typing `rbenv rehash` in the terminal.
3. Then we have to make the current virtual environment to be used globally. To do that type `rbenv global 2.2.3`.

> Always rehash the Ruby virtual environment by typing `rbenv rehash` in your terminal.

You can list out all available versions of Ruby by typing `rbenv list` in the terminal. Like wise to uninstall a ruby version do `rbenv uninstall ####` (where `####` is the version number of Ruby).

### 2.6 Step 6: RubyGems

Ruby comes preinstalled with RubyGems. But it is recommended that you update RubyGems by typing `gem update --system` in the terminal. To list all the installed gems type `gem list` in the terminal. To install a gem type in `gem install gem_name`, likewise to uninstall a gem type `gem uninstall gem_name` in the terminal.

### 2.7 Step 7: Installing Ruby on Rails

Open your terminal and type `gem install rails --no-ri --no-rdoc` (this will not install reference documents and code reference). Once installed type `rbenv rehash`.

### 2.8 Step 8: Installing MySQL and mysql2 gem

#### 2.8.1 Step 8.1: MySQL

1. Open terminal and type `brew install mysql` this will install the latest MySQL server.
2. Then copy `launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist` and paste it in the terminal then press enter.
3. Then set the `root` password by typing `mysqladmin -u root password` in the terminal.

To start the server type `mysql.service start`, likewise to stop type `mysql.service stop` in the terminal.

#### 2.8.2 Step 8.2: mysql2 gem

Open terminal and type `gem install mysql2 0.3.18` this will install the correct version.

## 3 Creating and running an application

Following are the steps:

### 3.1 Creating new application

Type `rails new via_command_line -d mysql` for pre-configured rails and msql project files.

### 3.2 Introduction to bundler

There are two file which are important to Bundler:

`gemfile` - edit this file to add your gems <br>
`gemfile.lock` - do not edit it yourself

Once you have configured what you want to, just type `bundle install` in the terminal and to list all bundles use `bundle list`.

> Note: `rake db:migrate` and `bundle exec rake db:migrate`

### 3.3 Accessing a project

#### 3.3.1 Running the server

Open terminal change the directory the application folder and type `rails server` or `rails s`. This will generate a web URL `http://localhost:3000`. Copy the link and open in a web browser. When you open the URL you might have error with `mysql2` due to some bug  in mysql2. So we use mysql2 version 0.3.18; i.e. in you Gemfile add `gem install 'msql2', '0.3.18'`. If you are using sqlite you don't have to make any changes. Once this is done initially you might need to comment out your database name in `config/database.yaml` as we did not create any database yet.

### 3.4 Generating views and controller

To generate files for Rails project type `rails generate` in the terminal; this will list out all the possible file that Rails can generate for you. To generate a controller and view, type `rails generate controller`, this will list out all the possible files this command can do, but type `rails generate controller controller_name view_name`; i.e `rails generate controller demo index`. This will create files under app folder. You might also want to edit `routes.rb` by typing in `get demo/index`.

At this point we have to edit one file which is under `app/controller/demo_controller.rb`. In this file you would have to type `layout false`, I will explain about this later.

To access this link you would have to goto `http://localhost:3000/demo/index`.

### 3.5 File structure

Below is the complete list of file that are generated when you create a project.

<pre>
simple_crm
|
+-- app -> Application code
|   |
|   +-- assets
|   |   |
|   |   +-- images
|   |   |   |
|   |   |   `-- .keep
|   |   +-- javascripts
|   |   |   |
|   |   |   +-- application.js
|   |   |   +-- demo.js
|   |   `-- stylesheets
|   |       |
|   |       +-- application.css
|   |       `-- demo.css # this is a file created by generator
|   +-- controllers
|   |   |
|   |   +-- application_controller.rb
|   |   +-- concerns -> common code folder for their specific use
|   |   |   |
|   |   |   `-- .keep
|   |   `-- demo_controller.rb
|   +-- helpers -> helper code for view
|   |   |
|   |   +-- application_helper.rb
|   |   `-- demo_helper.rb
|   +-- mailers
|   |   |
|   |   `-- .keep
|   +-- models
|   |   |
|   |   +-- .keep
|   |   `-- concerns
|   |       |
|   |       `-- .keep
|   `-- views
|       |
|       +--demo # this is a file created by generator
|       |  |
|       |  `-- index.html.erb
|       `-- layouts
|           |
|           `--application.html.erb
+-- bin -> command line files
|   |
|   +-- bundle
|   +-- rails
|   +-- rake
|   +-- setup
|   `-- spring
+-- config -> all configuration files
|   |
|   +-- application.rb
|   +-- boot.rb
|   +-- database.yml
|   +-- environment.rb
|   +-- environments
|   |   |
|   |   +-- development.rb -> development build of rails
|   |   +-- production.rb -> when launching rails to go live
|   |   `-- test.rb -> for testing rails
|   +-- initializers -> this folder is assessed when the app launches
|   |   |
|   |   +-- assets.rb
|   |   +-- backtrace_silencers.rb
|   |   +-- cookies_serializer.rb
|   |   +-- filter_parameter_logging.rb
|   |   +-- inflections.rb
|   |   +-- mime_types.rb
|   |   +-- session_store.rb
|   |   `-- wrap_parameters.rb
|   +-- locales -> internationalization
|   |   |
|   |   `-- en.yml
|   +-- routes.rb -> routing to pages and controller
|   `-- secrets.yml
+-- config.ru
+-- db -> database code folder
|   |
|   `-- seeds.rb
+-- Gemfile
+-- Gemfile.lock
+-- lib
|   |
|   +-- assets
|   |   |
|   |   `-- .keep
|   `-- tasks
|       |
|       `-- .keep
+-- log
|   |
|   +-- .keep
|   `-- development.log
+-- public -> this folder will be public
|   |
|   +-- 404.html
|   +-- 422.html
|   +-- 500.html
|   +-- favicon.ico
|   `-- robots.txt
+-- Rakefile
+-- README.rdoc
+-- test
+-- temp
`-- vendor -> 3rd party code place
    |
    `-- assets
        |
        +-- javascripts
        |   |
        |   `-- .keep
        `-- stylesheets
            |
            `-- .keep
</pre>

### 3.6 Handling server requests

Rails architecture is some what like an MVC architecture but a bit more robust. When an request is made for an html page rails first searches in the `public` folder, if a file is found it would never touch the Rails framework and returns the page. If there are not request found in the `public` folder then the process advances to rails framework.

For example I have an html file i.e. `test.html` placed in the public folder. To access this file all you have to do it run the server and the file name with or without the file extension i.e. `localhost:3000/test` or `localhost:3000/test.html`.

This can be tested by doing the following:

1. Create a folder named `demo` under `public` folder.
2. In the `demo` folder create an `index.html` page.

Now run the server (you don't have to restart the server if it's already running) and type `localhost:3000/demo/index.html` or `localhost:3000/demo/index` in your web browser. If you remember this URL looks like the the controller we created [here](#34-generating-views-and-controller), when you submit the URL `public` folder is accessed first not the rails framework.

### 3.7 Routing

When a file is not found in the `public` folder, the request is sent to `routes.rb` which determines which `controller` and `view` should be accessed.

Routes are processed as top to bottom.

There are different types of routes, three of those are as follows:

1. Simple rout (Match rout)
2. Default rout
3. Root rout

#### 3.7.1 Simple rout (Match rout)

This is a simplest form of routing in Rails. When you run the server and open an link for example `localhost:3000/demo/index`, Rails performs a get request. This get request can be seen in `routes.rb` i.e. `get 'demo/index'`. This small code is a shortcut code for `match` which can be written as

```
match 'demo/index',
  :to => 'demo#index',
  :via => :get
```

Hence the name Match rout

#### 3.7.2 Default route

Simple rout is not flexible, that means for every file we would have to create a static url. Default rout can have certain rules to do all this automatically.

Default rout follows `:controller/:action/:id` structure. For example `GET /student/edit/23` which means `student_controller`, `edit action` @ id `23`. So this can be written as the following:

```
match `:controller(/:action(/:id))`, :via => :get
```

`controller`, `action` and `id` are the keywords for Rails and `()` are there because each keyword can be optional. See [routes.db](#link-me)

You can also add the format which can be written as

```
match `:controller(/:action(/:id(.:format)))`, :via => :get
```

#### 3.7.3 Root rout

If a GET request is made and there are no match found then Rails should redirect to a default place called as `root`. The code for this can be written as `root :to => 'demo#index'` or `root 'demo#index'`

## 4 Controller, views and dynamic content

In this chapter we will look into more detailed approach on MVC architecture.

### 4.1 Template rendering

Here we will see hoe the controller chooses which view template to render and return back.

Do the following:

1. Create `hello.html.erb` in `app/view/demo/`
2. Edit the html file
3. Run the server

You can access the new html file by typing `localhost:3000/demo/hello`. You are able to do this without editing `routes.rb` because we added `match `:controller(/:action(/:id))`, :via => :get` to it. If this was not there then you would have to manually add an extra GET code `get 'demo/hello'`

Now, if you open `demo_controller.rb` from `app/controllers/` we can see that there is not action specified for the new `hello` template, this is not a problem Rails uses its default template system to render the output. But it is best practice to always define a action function for a temple. so we write the following code in there

```
def hello
end
```

You can also tell an action to load a template by using `render()` method. For example you can to render `demo/hello` you can write `render(:template => 'demo/hello')` or `render('demo/hello')` or `render('hello')` if it's in the same template.

`render` method is usually used in a `if..else` statements. For example if a user logs in successfully `render('welcome_page')` else `render('login_page')`.

### 4.2 Redirect action

You can redirect a request to different controller or action. This is based on `HTTP Redirect` (please see HTTP/1.1 302).

You can redirect to different controller or action by using `redirect_to()` method. For example:

```
def other_hello
    redirect_to(:controller => 'demo', :action => 'index')
end
```

To open this you would have to goto `localhost:3000/demo/other_hello` this will immediately redirect you to `index`. You can see this by looking at the logs in the terminal, which will look like this:

```
# this is the first request
Started GET "/demo/other_hello" for ::1 at 2015-11-08 13:30:39 +1300
Processing by DemoController#other_hello as HTML
Redirected to http://localhost:3000/
Completed 302 Found in 1ms (ActiveRecord: 0.0ms)

# then the request is redirect to this
Started GET "/" for ::1 at 2015-11-08 13:30:39 +1300
Processing by DemoController#index as HTML
  Rendered demo/hello.html.erb (0.1ms)
Completed 200 OK in 4ms (Views: 3.3ms | ActiveRecord: 0.0ms)
```

You can redirect it to any URL by defining an new action. For example

```
def google
 redirect_to('http://www.google.com')
end
```
