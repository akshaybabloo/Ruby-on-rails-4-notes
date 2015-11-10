class CreateUsers < ActiveRecord::Migration
  # def change
  #   create_table :users do |t|
  #
  #     t.timestamps null: false
  #   end
  # end

  def up
    create_table :users do |t| # this will creat the table
    # create_table :users, {:id => false} do |t| # this will not create an id column
      t.column 'first_name', :string, :limit => 25
      t.string 'last_name', :limit => 50
      t.string 'email', :default => '', :null => false
      t.string 'password', :limit => 40

      # t.timestams does the following
      # t.datetime 'created_at'
      # t.datetime 'updated_at'
      t.timestamps null: false
    end
  end

  def down
    drop_table :users # This will delete the table
  end
end
