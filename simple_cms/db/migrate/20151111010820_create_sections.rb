class CreateSections < ActiveRecord::Migration
  # this can be written as
  # def up
  #   create_table :sections do |t|
  #     t.string 'name'
  #     t.integer 'position'
  #     t.boolean 'visible'
  #
  #
  #     t.timestamps null: false
  #   end
  # end
  #
  # def down
  #   drop_table :sections
  # end

  def change
    create_table :sections do |t|
      t.integer 'page_id' # FK
      t.string 'name'
      t.integer 'position'
      t.boolean 'visible', :default => false
      t.string 'content_type'
      t.text 'content'

      t.timestamps null: false
    end
    add_index('sections', :page_id)
  end
end
