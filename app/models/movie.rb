class Movie <  ActiveRecord::Base
#  attr_accessible :title, :rating, :description, :release_date
#def self.movies(opt)
#self.order(opt)
#def self.all_ratings
 #       self.pluck(:rating).uniq
  #  end
def self.ratings
# self.pluck(:rating).uniq
       self.pluck(:rating).uniq

end
def self.movies(filters,sort_field)
self.where({:rating => filters}).order(sort_field)
end

end
