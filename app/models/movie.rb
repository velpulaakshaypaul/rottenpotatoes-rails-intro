class Movie <  ActiveRecord::Base include ActiveRecord::Calculations
#  attr_accessible :title, :rating, :description, :release_date
#def self.movies(opt)
#self.order(opt)
#def self.all_ratings
 #       self.pluck(:rating).uniq
  #  end
def self.ratings
 self.pluck(:rating).uniq
self.sele
end
end
