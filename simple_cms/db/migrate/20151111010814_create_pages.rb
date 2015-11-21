class CreatePages < ActiveRecord::Migration
  def up
    create_table :pages do |t|
      t.integer 'subject_id' # same as `t.references :subject`
      t.string 'name'
      t.integer 'permalink'
      t.integer 'position'
      t.boolean 'visible', :default => false

      t.timestamps null: false
    end
    add_index('pages', 'subject_id') # FK
    add_index('pages', 'permalink')
  end

  def down
    drop_table :pages
  end
end
