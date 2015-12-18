require 'active_record'
require 'sqlite3'
require 'pry'

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database:"db/school.db")

ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.logger.formatter = ->(_,_,_,msg) {msg}

class Student < ActiveRecord::Base
  # course_id
  belongs_to :course
end

class Course < ActiveRecord::Base
  has_many :students
end

binding.pry
