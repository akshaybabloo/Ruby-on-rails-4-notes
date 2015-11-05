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

To generate files for Rails project type `rails generate` in the terminal; this will list out all the possible file that Rails can generate for you. To generate a controller and view, type `rails generate controller`, this will list out all the possible files this command can do, but type `rails generate controller controller_name view_name`; i.e `rails generate controller demo index`. This will create files under app folder. You might also want to edit `routes.rb` by typing in `get demo/index`. To access this link you would have to goto `http://localhost:3000/demo/index`

### 3.5 File structure

Below is the complete list of file that are generated when you create a project.

<pre>
simple_crm
|
+-- app
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
|   |   +-- concerns
|   |   |   |
|   |   |   `-- .keep
|   |   `-- demo_controller.rb
|   +-- helpers
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
+-- bin
|   |
|   +-- bundle
|   +-- rails
|   +-- rake
|   +-- setup
|   `-- spring
+-- config
|   |
|   +-- application.rb
|   +-- boot.rb
|   +-- database.yml
|   +-- environment.rb
|   +-- environments
|   |   |
|   |   +-- development.rb
|   |   +-- production.rb
|   |   `-- test.rb
|   +-- initializers
|   |   |
|   |   +-- assets.rb
|   |   +-- backtrace_silencers.rb
|   |   +-- cookies_serializer.rb
|   |   +-- filter_parameter_logging.rb
|   |   +-- inflections.rb
|   |   +-- mime_types.rb
|   |   +-- session_store.rb
|   |   `-- wrap_parameters.rb
|   +-- locales
|   |   |
|   |   `-- en.yml
|   +-- routes.rb
|   `-- secrets.yml
+-- config.ru
+-- db
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
+-- public
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
`-- vendor
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
