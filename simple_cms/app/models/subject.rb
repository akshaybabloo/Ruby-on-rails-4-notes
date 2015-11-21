class Subject < ActiveRecord::Base

  has_one :page # one-to-one relationship

  # with scope you can make custom queries. Just call with class name, example `Subject.visible`
  scope :visible, lambda{where(:visible => true)}
  scope :invisible, lambda{where(:visible => false)}
  scope :sorted, lambda{order('subjects.position ASC')}
  scope :newest_first, lambda{order('subjects.created_at DESC')}
  scope :search, lambda{|name| where(['name LIKE ?', "%#{name}%"])} # this acts like a wild card search
end
