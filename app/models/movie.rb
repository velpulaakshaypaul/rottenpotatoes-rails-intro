class Movie < ActiveRecord::Base
#  attr_accessible :title, :rating, :description, :release_date
def self.movies(opt)
self.order(opt)
end
end
