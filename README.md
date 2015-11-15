# Ruby on Rails 4 Notes

> Note 1: Always type these commands in the Rails folder after you create a project.

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

### 2.1 Mac

#### 2.1.1 Step 1: Editing .bash_profile

* Open terminal and type `cd ~`, the type `nano .bash_profile`.
* This will open nano editor with your .bash_profile file. In this file type in the following

```sh
# MySQL
export PATH="/usr/local/mysql/bin:$PATH"

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
```

* Save the file with `ctrl + x` and `y` for yes.

#### 2.1.2 Step 2: Install XCode and command line tools

* Open App store and search for XCode. Click on Install to install the software.  
* Once the software is installed, open the software then go to `XCode -> Preference`. Goto `Download` tab and download the Command line tools

#### 2.1.3 Step 3: Installing Homebrew

Go to [Homebrew](http://brew.sh/) website and follow the instillation procedure

#### 2.1.4 Step 4: Installing Ruby virtual environment (rbenv)

Open terminal and type `brew update` to update the list of available software. Then type `brew install rbenv`.

#### 2.1.5 Step 5: Installing Ruby

OSX comes preinstalled Ruby 2. To check what version you are using type `ruby -v` in terminal. But we would be using virtual environment to install the latest version of Ruby and Rails. Do the following:

1. Goto [Ruby download page](https://www.ruby-lang.org/en/downloads/) and check the current stable Ruby version number. At the time of this tutorial the stable version was `2.2.3`. Now, to install ruby in a virtual environment type `rbenv install 2.2.3` in your terminal.
2. Once Ruby is installed you would have to rehash the virtual environment by typing `rbenv rehash` in the terminal.
3. Then we have to make the current virtual environment to be used globally. To do that type `rbenv global 2.2.3`.

> Always rehash the Ruby virtual environment by typing `rbenv rehash` in your terminal.

You can list out all available versions of Ruby by typing `rbenv list` in the terminal. Like wise to uninstall a ruby version do `rbenv uninstall ####` (where `####` is the version number of Ruby).

#### 2.1.6 Step 6: RubyGems

Ruby comes preinstalled with RubyGems. But it is recommended that you update RubyGems by typing `gem update --system` in the terminal. To list all the installed gems type `gem list` in the terminal. To install a gem type in `gem install gem_name`, likewise to uninstall a gem type `gem uninstall gem_name` in the terminal.

#### 2.1.7 Step 7: Installing Ruby on Rails

Open your terminal and type `gem install rails --no-ri --no-rdoc` (this will not install reference documents and code reference). Once installed type `rbenv rehash`.

#### 2.1.8 Step 8: Installing MySQL and mysql2 gem

##### 2.1.8.1 Step 8.1: MySQL

1. Open terminal and type `brew install mysql` this will install the latest MySQL server.
2. Then copy `launchctl load ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist` and paste it in the terminal then press enter.
3. Then set the `root` password by typing `mysqladmin -u root password` in the terminal.

To start the server type `mysql.service start`, likewise to stop type `mysql.service stop` in the terminal.

##### 2.1.8.2 Step 8.2: mysql2 gem

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

> Note 2: `rake db:migrate` and `bundle exec rake db:migrate`

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

```Ruby
match 'demo/index',
  :to => 'demo#index',
  :via => :get
```

Hence the name Match rout

#### 3.7.2 Default route

Simple rout is not flexible, that means for every file we would have to create a static url. Default rout can have certain rules to do all this automatically.

Default rout follows `:controller/:action/:id` structure. For example `GET /student/edit/23` which means `student_controller`, `edit action` @ id `23`. So this can be written as the following:

```Ruby
match `:controller(/:action(/:id))`, :via => :get
```

`controller`, `action` and `id` are the keywords for Rails and `()` are there because each keyword can be optional. See [routes.rb](https://github.com/akshaybabloo/Ruby-on-rails-4-notes/blob/master/simple_cms/config/routes.rb)

You can also add the format which can be written as

```Ruby
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

```Ruby
def hello
end
```

You can also tell an action to load a template by using `render()` method. For example you can to render `demo/hello` you can write `render(:template => 'demo/hello')` or `render('demo/hello')` or `render('hello')` if it's in the same template.

`render` method is usually used in a `if..else` statements. For example if a user logs in successfully `render('welcome_page')` else `render('login_page')`.

### 4.2 Redirect action

You can redirect a request to different controller or action. This is based on `HTTP Redirect` (please see HTTP/1.1 302).

You can redirect to different controller or action by using `redirect_to()` method. For example:

```Ruby
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

```Ruby
def google
 redirect_to('http://www.google.com')
end
```

### 4.3 View template

Till now you have only seen how a web renders an HTML page which is not dynamic. You can put ruby code inside of HTML pages to make them dynamic. To do this we use ERB (Embedded Ruby), it is an eRuby template system. For example we have file in the `view` folder called `index.html.erb`, which means it has a template name as `index`, process it as `ERB` and give an output as `html`

You can embed a code in `erb` template with the following syntax:

* `<% code %>` - this will only execute the ruby code
* A variation of the above code is `<%= code %>` - this will execute the ruby code and outputs it

For example open `hello.html.erb` template and do the following

* Type in `<%= 1+1 %>`

### 4.4 Instance variable

Instance variables helps in accessing data gathered by the controller and present it to view (template). Ruby is an object oriented programming language, so every class has an instance variable which can be used across the class. If you open `demo_controller.rb` from `app/controller/` you can see that `DemoController` is a subclass (`<`) of `ApplicationController`, that means it's a class which can have instances.

To use instance we have to use `@` sign before a variable. For example `@instance` (a variable can be anything).

To access a variable in template, we would have to put an instance in a function. For example:

```Ruby
def hello
  @array = [1,2,3,4]
end
```

To use this instance variable in the template just call it by the instance name:

```HTML+ERB
<% @array.each do |n| %>
  <%= n %><br>
<% end %>
```

### 4.5 Hyperlinks

Instead of using `href` to link to another page Rails uses much powerful method to link html files.

The syntax is `<%= link_to(text, target)%>`

Target can be any two of the following:

* `'demo/index'` - if the you want to link it in the same controller.
* `{:controller => 'demo', :action => 'index'}` - if you want to link it to a different controller.

This syntax generates an html `href` tag which links to the action provided. This example can be seen in [hello.html.erb](https://github.com/akshaybabloo/Ruby-on-rails-4-notes/blob/master/simple_cms/app/views/demo/hello.html.erb) but if you see this in [index.html.erb](https://github.com/akshaybabloo/Ruby-on-rails-4-notes/blob/master/simple_cms/app/views/demo/index.html.erb) when you hover on the second link you will see that there is no full url like `localhost:3000/demo/index` this is because we have added `root demo#index` in the [routs.rb](https://github.com/akshaybabloo/Ruby-on-rails-4-notes/blob/master/simple_cms/config/routes.rb) file which will reduce the link to `localhost:3000/`

> Note 3: This shows that not only does `routs.rb` show how the pages are routed but it also plays an important role in how the links are created.

### 4.6 URL parameters

When an URL consists of string after `?` those are called parameters. For example `localhost:3000/demo/index/1?name=akshay&age=25`, these parameters helps in sending data to the server (ROR) which can process the data. Parameters are key-value pairs.

`:id` is put to the left side of the URL, this can be seen in [routs.rb](https://github.com/akshaybabloo/Ruby-on-rails-4-notes/blob/master/simple_cms/config/routes.rb). Rails uses Parameter hashing method called `params` which uses `HashWithIndifferentAccess`, that means that you can have an key-value pair as `params['id']` or `params[:id]` and you can call these as `params['id']`, `params[:id]` or `@id`. See hello.html.erb](https://github.com/akshaybabloo/Ruby-on-rails-4-notes/blob/master/simple_cms/app/views/demo/hello.html.erb) for the examples.

In ruby we have an object called `inspect`, which will outline the output. An example of this is shown in my Ruby tutorial for [hash](https://github.com/akshaybabloo/Ruby-notes/blob/master/src/ObjectTypes_2/hashes_2_6.rb#L5); To use this in Rails you can add `<%= params.inspect %>` which can make troubleshooting easy.

## 5 Database and migrations

Databases are the core concepts you have to learn before creating an CMS. Here you will learn how to use and implement database and migrate them.

### 5.1 Database introduction

Usually Rails takes care of database structure, but some concepts of databases are important to know. I would suggest get a basic knowledge of databases which are available on the internet. Databases use `CRUD` concepts which means `C - create, R - Read, U - Update and D- Delete`. I will be discussing about them as I go along.

### 5.2 Creating a database

Rails provide ways to create databases but I suggest using command line to create a database.

There are  four important keywords that you would need to know to create, use and delete a database, and they are:

1. `SHOW DATABASES;` - Show all the databases available.
2. `CREATE DATABASE database_name;` - Creating a new database.
3. `USE database_name;` - Use the database to add tables.
4. `DROP DATABASE database_name;` - Delete a database.

Lets create a database:

* If you have created a password for your mysql login, you would have to enter `mysql -u root -p` which will ask you for your root password for mysql login.
* You can show databases available by entering `SHOW DATABASES;`. This will list out all default installed databases.
*  To create a data base type `CREATE DATABASE simple_cms_development;`. This will reply with `Query OK, 1 row affected (0.03 sec)` which means that a database has been created. You can conform this by typing `SHOW DATABASE;`
* It is not a good idea to give Rails all the permissions of `root`, it is better to create a username for the Rails to use the database and give the permissions to use the database just created. To do that the syntax for that is
```sql
GRANT ALL PRIVILEGES ON database_name.*
TO 'username'@'localhost'
IDENTIFIED BY 'password';
```
So to create and grant permissions do the following
```sql
GRANT ALL PRIVILEGES ON simple_cms_development.*
TO 'simple_cms'@'localhost'
IDENTIFIED BY 'akshay12';
```
Which will show you an output as `Query OK, 0 rows affected (0.05 sec)`, that means the username and permissions has been granted.
* You can show all the granted databases for a user by typing `SHOW GRANT FOR 'username'@'localhost';`.
* You can exit root mysql with `exit` command and login as `simple_cms` by typing `mysql -u simple_cms -p simple_cms_development`. This means login with the username provide and use simple_cms_development database.

### 5.3 Configuring Rails to use the username and database

The data base file will be under `config/database.yml`, open this file. You would have to edit the `default`, which can be seen in [database.yml](https://github.com/akshaybabloo/Ruby-on-rails-4-notes/blob/master/simple_cms/config/database.yml).

Then you can test the database by typing `rake bd:schema:dump`. This should not return any error that means the databases is accessible by Rails. This will also create a file called `schema.rb` under `db/` folder.

### 5.4 What is Rake?

It's a simple ruby program which helps us to run tasks. It is something similar to `make` command in unix. It uses `RakeFile` which is available in the root folder of the project. You can list out all the tasks available for Rake to use by typing `rake -T`. You can see that there are `db` tasks which will be used a lot in this chapter.

Rake can also take in variable names. Most often used is `rake db:schema:dump RAILS_ENV=production`. By default Rails uses development environment, to change the environment you would have to use this command.

### 5.5 Rails migration

Migrate means to change the state of a database which means that you can create a new table, add row or column to an existing table.

### 5.6 Generating migrations

To generate migration type `rails generate migration DoNothingYet` in the terminal. This will create a folder called `migrate` under `db/`. There are two ways of doing migrations in Rails. One using `change` and the other is using `up` and `down`. See `db/migrate/0151110041214_do_nothing_yet.rb`.

The other way to create migrations is to create a model. To do that type in `rails generate model User` on terminal, this will create few files for us. That will give you an output like this
```Sh
invoke  active_record
   create    db/migrate/20151110041214_do_nothing_yet.rb
akshayrajgollahalli:simple_cms (master): rails generate model User
   invoke  active_record
   create    db/migrate/20151110042612_create_users.rb
   create    app/models/user.rb
   invoke    test_unit
   create      test/models/user_test.rb
   create      test/fixtures/users.yml
```

Open `db/migrate/20151110042612_create_users.rb` file, in which you will find a shortcut method which we will not look into as of now. So we will change this into `up` and `down` methods. There are two ways of creating table columns:

1. A long version of it is `t.column 'name', :type, options` - example: `t.column 'first_name', :string`
2. A shortcut method is `t.type 'name', options` - example: `t.string 'last_name'`

There are 10 types of column types (generally used):

1. binary
2. boolean
3. data
4. datetime
5. decimal
6. float
7. integer
8. string
9. text
10. time

And the options are:

1. `:limit => size` - size of the field or how many chars the field should accept
2. `:default => value` - default value to the column
3. `:null => true/false` - If an column can be null or not
4. `:precision => number` - for decimal columns
5. `:scale => number` - for decimal columns

5.7 Running migrations

To migrate type `rake db:migrate` in the terminal and this is its output:
```
== 20151110041214 DoNothingYet: migrating =====================================
== 20151110041214 DoNothingYet: migrated (0.0000s) ============================

== 20151110042612 CreateUsers: migrating ======================================
-- create_table(:users)
   -> 0.0312s
== 20151110042612 CreateUsers: migrated (0.0313s) =============================
```

This will create two tables, you can log into mysql by doing `mysql -u simple_cms -p simple_cms_development`. you can list out table by typing `SHOW TABLES`. Then you can list out the fields associate to each table by typing `SHOW FIELDS FROM users;` which will print
```
+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| id         | int(11)      | NO   | PRI | NULL    | auto_increment | -> This is automatically added by Rails
| first_name | varchar(25)  | YES  |     | NULL    |                |
| last_name  | varchar(50)  | YES  |     | NULL    |                |
| email      | varchar(255) | NO   |     |         |                |
| password   | varchar(40)  | YES  |     | NULL    |                |
| created_at | datetime     | NO   |     | NULL    |                | -> t.timestam created this
| updated_at | datetime     | NO   |     | NULL    |                | -> and this
+------------+--------------+------+-----+---------+----------------+
```

All the migration versioning is located in `schema_migration` table which is located in the mysql.

Migrations has also done one other thing, that is to write some entries in `/db/schema.rb`, when ever you run a schem rails dumps the schema to this file and this file also shows the current state of the database.

To migrate down type in the following `rake db:migrate VERSION=0` which will output
```
== 20151110042612 CreateUsers: reverting ======================================
-- drop_table(:users)
   -> 0.0442s
== 20151110042612 CreateUsers: reverted (0.0443s) =============================

== 20151110041214 DoNothingYet: reverting =====================================
== 20151110041214 DoNothingYet: reverted (0.0000s) ============================
```

You can ask for the status of migrated files by typing `rake db:migrate:status` the output to that is
```
database: simple_cms_development

 Status   Migration ID    Migration Name
--------------------------------------------------
  down    20151110041214  Do nothing yet
  down    20151110042612  Create users
```
You can also migrate to one table by typing `rake db:migrate VERSION=20151110041214`, this will only migrate `do nothing yet` table.

Running migrate command are as follows

1. rake db:migrate
2. rake db:migrate VERSION=0
3. rake db:migrate VERSION=20151110041214
4. rake db:migrate:status
5. rake db:migrate:up VERSION=20151110041214
6. rake db:migrate:down VERSION=20151110041214
7. rake db:migrate:redo VERSION=20151110041214

### 5.8 Migration methods

There are different types of table migration methods, few of them are

1. To create a table
```Ruby
create_table(table, options) do |t|
.....columns....
end
```
2. Drop table - `drop_table(table)`
3. Rename table - `rename_table(table, ne_name)`

Column migration methods:

1. add_column(table, column, type, options)
2. remove_column(table, column)
3. rename_column(table, column, new_name)
4. change_column(table, column, type, options)

There are two migration methods for index:

1. add_index(table, column,options)
2. remove_index(table,column)

Options for index migrations:

1. `:unique => true/false`
2. `:name => 'your_custom_name'`

Execute migration method - `execute('any sql string')` - this executes any sql string give to it.

Lets test it out:

Type `rails generate migration AlterUsers`, see `/db/migrate/20151110061255_alter_users.rb`

### 5.9 Solving migration problems

A problem I faced when doing `rake db:migrate VERSION=0` is that I would get an error as `Index name 'index_admin_users_on_username' on table 'admin_users' does not exist`. Then I tried the following commands:

1. `rake db:drop` - which drops all the tables
2. `rake db:create` - which creates all the tables
3. `rake db:migrate` - which migrates the tables

`rake db:drop` and `rake db:create` gave me an `access denied` error. That means the problem is with MySQL not with Rails. So I had to give permission to `simple_cms` user. To do that open your MySQL root user in terminal by typing `mysql -u root -p` and enter the password. Now type `GRANT ALL PRIVILEGES ON * . * TO 'simple_cms'@'localhost';` this means that you are providing all the privileges to this user. Once this is done go back to the terminal and type these three commands:

1. `rake db:drop` - which drops all the tables **This will delete all the data in the database**
2. `rake db:create` - which creates all the tables
3. `rake db:migrate` - which migrates the tables

This should create all the tables and migrate the data for you. At this point you can also do `rake db:migrate VERSION=0`.

### 5.10 Migrations for CMS

Lets create model for our CMS.

We would have to create three models; `Subject`, `Pages` and `Section`. These can be created by the following command:
```sh
rails generate model Subject
rails generate model Pages
rails generate model Section
```
Once done lets edit migration files. See
```
20151111010749_create_subjects.rb
20151111010814_create_pages.rb
20151111010820_create_sections.rb
```
Once the files are edited with its column names type `rake db:migrate` in terminal.

## 6. Models, ActiveRecord and ActiveRelation

In this chapter we will learn the working principal of Models, ActiveRecord and ActiveRelation

### 6.1 ActiveRecord and ActiveRelation

#### 6.1.1 ActiveRecord

When written in all lower case with space `active record` - it is a design pattern for relational databases, which is not a part of Rails and can be implemented in any object oriented programming. but when written as `ActiveRecord` - it is a rails implementation of design pattern. It helps us to retrieve and manipulate data as objects, not as static rows.

These objects are pretty intelligent, which means that they understand the structure of the table, contains the data retrieved from the row, it know how to CRUD and can be manipulated as objects and then they can be saved.

For example:

```Ruby
user = User.new # instance of User class

user.first_name = 'akshay'
user.save # executes an sql insert command

user.last_name = 'gollahalli'
user.save # if last_name is filled then it will execute sql update command

user.delete # this will execute sql delete command
```

#### 6.1.2 ActiveRelation

It was added in Rails v3 on wards which is also known as `ARel`. It is an object oriented implementation of relational algebra. ActiveRelation does some complex sql queries behind the scene.

For example:
```Ruby
users = User.where(:first_name => 'Akshay')
users = users.order("last_name ASC").limit(5)
users = users.include(:articles_authored)
```
above three lines of code will generate (this might not be the exact sql query that will be generated but just for an idea)
```sql
SELECT users.*, articles.* FROM users LEFT JOIN articles
ON (users.id = articles.author_id) WHERE users.first_name = 'akshay'
ordered by last_nem ASC LIMIT 5
```

### 6.2 Generating a Model

When ever you enter the command `rail generate model Subject`, rails create the following files

```
db/migrate (everything in migrate is pural):

20151111010749_create_subjects.rb
    With class name `CreateSubjects` that inherits `ActiveRecord::Migration`
    And has function
        def change
        end

app/modles (everything in model is singular):

subject.rb
    With class name `Subject` that inherits `ActiveRecord::Base`
```

Remember we changed the table name `users` to `admin_users`, this can be seen in `20151110062439_alter_users.rb`, when ruby searchs for `admin_users` it will not find the model, to rectify this proble we need to configure rails. This can be done in two ways:

* Open `users.rb` and tell the rails that the name has been chage to something els eby typing `self.table_name = 'admin_users'`
<p align="center"><b>OR</b></p>
* You can rename the file - `users.rb` -> `admin_users.rb` and the class name - `Users` -> `AdminUsers`

### 6.3 Rails console

Type `rails console` or `rails c` in your terminal. By default rails console loads as development environment, you can load into different environment by typing `rails console production`

Rails console is nothing but an `irb` with Rails application included in it. You can check the contents of every model from Rails console. for example open rails console and type in `subject = Subject.new` this will list out which will output your Subject class `#<Subject id: nil, name: nil, position: nil, visible: false, created_at: nil, updated_at: nil>`

### 6.4 Creating records

Creating records through rails console. There are two ways of doing it:

**New/save**

The following are the steps

1. Instantiate object
2. Set values
3. Save

**Create**

There is only one step

1. Instantiate object, Set values and Save

Open terminal and enter `rails console`.

In here you can enter `subject = Subject.new` which will print out
```
=> #<Subject id: nil, name: nil, position: nil, visible: false, created_at: nil, updated_at: nil>
```
You can add remove data by typing `subject.name = 'some_name'`, when you enter `subject.name` you will get `some_name`. The other way is to do the following
```Ruby
subject = Subject.new(:name => 'some_name', :position => 1, :visible => true)
```
Then to save it type `subject.save` this will save and print out the sql string like this:
```
(0.9ms)  BEGIN
SQL (7.2ms)  INSERT INTO `subjects` (`name`, `position`, `visible`, `created_at`, `updated_at`) VALUES ('some_name', 1, 1, '2015-11-11 04:22:10', '2015-11-11 04:22:10')
(5.4ms)  COMMIT
=> true
```

Using **create** technique which is also know as `mass assignment` you can do the following:
```Ruby
subject = Subject.create(:name => 'subject_name', :position => 2)
```
this will print and return
```
(0.1ms)  BEGIN
SQL (0.4ms)  INSERT INTO `subjects` (`name`, `position`, `created_at`, `updated_at`) VALUES ('subject_name', 2, '2015-11-11 04:27:21', '2015-11-11 04:27:21')
(1.8ms)  COMMIT
=> #<Subject id: 2, name: "subject_name", position: 2, visible: false, created_at: "2015-11-11 04:27:21", updated_at: "2015-11-11 04:27:21">
```
You can check the contents of the mysql by logging in as `simple_cms` and entering the query `select * from subjects;`
```
+----+--------------+----------+---------+---------------------+---------------------+
| id | name         | position | visible | created_at          | updated_at          |
+----+--------------+----------+---------+---------------------+---------------------+
|  1 | some_name    |        1 |       1 | 2015-11-11 04:22:10 | 2015-11-11 04:22:10 |
|  2 | subject_name |        2 |       0 | 2015-11-11 04:27:21 | 2015-11-11 04:27:21 |
+----+--------------+----------+---------+---------------------+---------------------+
```

In the ruby file then you can do something like this once the record is created:
```Ruby
if subject.save
  # do something
else
  # do something
end
```
### 6.5 Updating records

There are two ways of doing it

**Find/save**

1. Find record
2. Set values
3. Save

**Find/update_records**

1. Find record
2. Set values and save it

To find a subject type in `subject = Subject.find(1)` where `1` is the Primary Key (PK) in rails console. This will create sql query and return an object as
```
Subject Load (2.5ms)  SELECT  `subjects`.* FROM `subjects` WHERE `subjects`.`id` = 1 LIMIT 1
=> #<Subject id: 1, name: "some_name", position: 1, visible: true, created_at: "2015-11-11 04:22:10", updated_at: "2015-11-11 04:22:10">
```
Now you can type `subject.name = 'update subject'` and then `subject.save`. This will return
```
subject.save
   (0.2ms)  BEGIN
  SQL (2.7ms)  UPDATE `subjects` SET `name` = 'update subject', `updated_at` = '2015-11-11 05:25:51' WHERE `subjects`.`id` = 1
   (1.4ms)  COMMIT
=> true
```
Using mass assignment you can do:

1. subject = Subject.find(2)
2. subject.update_attributes(:name => 'next subject', :visible => true)

This will update the record.

Now once update you can do something like this:
```Ruby
if subject.update_attributes(:name => 'next subject')
  # do something
else
  # do something
end
```

### 6.6 Deleting records

You can do that by doing

1. Find record and then
2. Destroy

Do the following:

1. create a new subject by typing `subject = Subject.create(:name => 'bad subject', :position => 3)`
2. next find the subject `subject = Subject.find(3)`
3. then do `subject.destroy`. This will return
```
(0.2ms)  BEGIN
SQL (0.4ms)  DELETE FROM `subjects` WHERE `subjects`.`id` = 3
 (0.6ms)  COMMIT
=> #<Subject id: 3, name: "bad subject", position: 3, visible: false, created_at: "2015-11-11 05:38:13", updated_at: "2015-11-11 05:38:13">
```

### 6.7 Finding records

The following are the types of finding the records

* Primary key finder - This can be done using `Subject.find(2)` - This returns an object or an error
* Dynamic finders - syntax is `Subject.find_by_id(2)` - returns an object or nil **OR** `Subject.find_by_name('some name')` that means that you can find anything with the column name.
* All - syntax is `Subject.all` - returns an array of objects
* First/last methods - syntax is `Subject.first` and `Subject.last` - this returns an object or nil.

All codes given above goes to the mysql as soon as the code is executed where as `ActiveRelation` does not.

Lets create a record by typing `subject = Subject.create(:name => 'your name', :position => 3)` then to test out the difference you can try to find a deleted record by typing `subject = Subject.find(3)` this will give you a full stack error that will in production will show you `404` or `500` error, you can change the finding by doing `subject =Subject.find_by_id(3)` which will generate the exact sql query but it will return `nil`.

### 6.8 Conditional: Where

For complex queries where conditions are involved `where(condition)` is used.

For example

```Ruby
Subject.where(:visible => true)
```
This will be looking out for all subjects who's visibility is true. This will return ActiveRelation method which can be daisy chained with others.

For example

```Ruby
Subject.where(:visible => true).order("position ASC")
```
This does not immediately call a database query immediately, Rails first combines the query and then request the call.

**Types**

* Strings - `where("name = 'some name' AND visible = true")` - This is susceptible to SQL injection.
* Arrays - `where(["name = ? AND visible = true", "first_name"])` - where the question mark is a place holder for `first_name` this is flexible and is safe from SQL injection.
* Hash - `Subject.where(:name = 'akshay', :visible => true)` - easy and safe from SQL injection. Eave key vale pair is joined by `AND`. Hash cannot have OR, Like, less than or greater than.

Goto your rails console and do the following examples:

```Ruby
subject = Subject.where(:visible => true)
```
Which will return an array
```
 Subject Load (18.2ms)  SELECT `subjects`.* FROM `subjects` WHERE `subjects`.`visible` = 1
=> #<ActiveRecord::Relation [#<Subject id: 1, name: "update subject", position: 1, visible: true, created_at: "2015-11-11 04:22:10", updated_at: "2015-11-11 05:25:51">]>
```
You can also ask rails to show you the generated sql by doing `subject.to_sql` which will return:
```sql
SELECT `subjects`.* FROM `subjects` WHERE `subjects`.`visible` = 1
```
You can use this by putting in a string:
```Ruby
subject = Subject.where('visible = true')
```
Which will return
```
Subject.where('visible = true')
  Subject Load (6.2ms)  SELECT `subjects`.* FROM `subjects` WHERE (visible = true)
=> #<ActiveRecord::Relation [#<Subject id: 1, name: "update subject", position: 1, visible: true, created_at: "2015-11-11 04:22:10", updated_at: "2015-11-11 05:25:51">]>
```
With array:
```Ruby
subject = Subject.where(['visible = ?', true])
```
**OR**
<br>
```Ruby
subject = Subject.where('visible = ?', true)
```

You can also daisy chain the query by doing:
```Ruby
subject = Subject.where(:visible => true).where(:position => 1)
```
which returns
```
Subject Load (18.0ms)  SELECT `subjects`.* FROM `subjects` WHERE `subjects`.`visible` = 1 AND `subjects`.`position` = 1
=> #<ActiveRecord::Relation [#<Subject id: 1, name: "update subject", position: 1, visible: true, created_at: "2015-11-11 04:22:10", updated_at: "2015-11-11 05:25:51">]>
```

### 6.9 Conditional: Order, Limit and Offset

Order - You can sort the queries by doing `order(sql)`
Limit - You can limit an query by a number `limit(number)`
Offset - This will enable you to skip over the records by a number `offset(number)`

For example
```Ruby
Subject.order('position ASC').limit(10).offset(30)
```

Usually you would not give the table name when you use order. The problem would start when you start joining two tables, like joining a two columns of different tables.

Open your rails console and do the following:

```Ruby
subject = Subject.where(:visible => false).order("position DESC")
```
which will return
```
Subject Load (16.8ms)  SELECT `subjects`.* FROM `subjects` WHERE `subjects`.`visible` = 0  ORDER BY position DESC
=> #<ActiveRecord::Relation [#<Subject id: 4, name: "your name", position: 3, visible: false, created_at: "2015-11-11 06:15:32", updated_at: "2015-11-11 06:15:32">, #<Subject id: 2, name: "subject_name", position: 2, visible: false, created_at: "2015-11-11 04:27:21", updated_at: "2015-11-11 04:27:21">]>
```

You can limit it by `1` doing the following:
```Ruby
subject = Subject.where(:visible => false).order("position DESC").limit(1)
```
This will return
```
Subject Load (0.8ms)  SELECT  `subjects`.* FROM `subjects` WHERE `subjects`.`visible` = 0  ORDER BY position DESC LIMIT 1
=> #<ActiveRecord::Relation [#<Subject id: 4, name: "your name", position: 3, visible: false, created_at: "2015-11-11 06:15:32", updated_at: "2015-11-11 06:15:32">]>
```

You can offset (skip) by doing:
```Ruby
subject = Subject.where(:visible => false).order("position DESC").limit(1).offset(1)
```
which will return
```
Subject Load (0.4ms)  SELECT  `subjects`.* FROM `subjects` WHERE `subjects`.`visible` = 0  ORDER BY position DESC LIMIT 1 OFFSET 1
=> #<ActiveRecord::Relation [#<Subject id: 2, name: "subject_name", position: 2, visible: false, created_at: "2015-11-11 04:27:21", updated_at: "2015-11-11 04:27:21">]>
```

You can also specify the table name, in this case its `subjects` by doing:
```Ruby
subject = Subject.where(:visible => false).order("subjects.position DESC").limit(1).offset(1)
```

### 6.10 Named Scopes

You can write custom queries with names scopes.

To define a scope the syntax for that is:

```Ruby
scope :name_of_the_scope, lambda {where(:active => true)}  
```
**OR**
<br>
Using `stabby lambda syntax`
```Ruby
scope :name_of_the_scope, -> {where(:active => true)}  
```

There are differences between using `lambda` and `stabby lambda`, but we will stick to `lambda`

A lambda `lambda {where(:active => true)}` can be `def` as
```Ruby
def self.active
  where(:active => true)
end
```

Named scopes can also take in arguments, which can be written as
```Ruby
scope :name_of_the_scope, lambda {|your_name| where(:name => your_name)}  
```

Lets test it out. Open `/apps/models/subjects.rb`. see [subjects.rb](https://github.com/akshaybabloo/Ruby-on-rails-4-notes/blob/master/simple_cms/app/models/subject.rb)

Once you have written the code, you would have you reload the rails console so that this new class is loaded. To get a query type in `Subject.visible` this will return all the `:visible => true`

## 7 Table associations

There are different types of table associations, such as

* [One-to-one associations]
* [One-to-many associations]
* [Many-to-many associations]

### 7.1 One-to-one associations

<center><img aligh="middle" src="https://raw.githubusercontent.com/akshaybabloo/Ruby-on-rails-4-notes/master/images/1-2-1.png" width="300"></center>
