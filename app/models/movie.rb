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
def self.movies(test,sort_field)
return self.order(sort_field) if not test
self.where({:rating => test.keys}).order(sort_field)
end

end
