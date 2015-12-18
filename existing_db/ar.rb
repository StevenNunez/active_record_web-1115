require 'active_record'
require 'sqlite3'
require 'pry'

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database:"music.db")

ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.logger.formatter = ->(_,_,_,msg) {msg}

class Artist < ActiveRecord::Base
  has_many :albums
  # has_many :tracks, :through => :albums
  has_many :tracks, through: :albums
  validates :name, presence: true
end

class Album < ActiveRecord::Base
  # artist_id column
  belongs_to :artist
  has_many :tracks
end

class Track < ActiveRecord::Base
  # album_id column
  belongs_to :album
end

# class User < ActiveRecord::Base
#   has_many :pledges
#   has_many :projects, through: :pledges
# end
# class Pledge < ActiveRecord::Base
#   # user_id
#   belongs_to :user
#   # project_id
#   belongs_to :project
# end
# class Project < ActiveRecord::Base
#   has_many :pledges
#   has_many :users, through: :pledges
# end
binding.pry
