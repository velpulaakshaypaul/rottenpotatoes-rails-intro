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
begin
return self.order(sort_field) if not test
self.where({:rating => test}).order(sort_field)
rescue
self.order(sort_field)
end
end


def self.set_options(params,session)
setup={:redirect => false }
setup[:ratings]= if params[:ratings]
if params[:ratings].kind_of? Hash
params[:ratings].keys
else
params[:ratings]
end
elsif session[:ratings]
setup[:redirect]=true
session[:ratings]
else
self.ratings
end

setup[:sort_by] = if params[:sort_by] 
params[:sort_by]
elsif session[:sort_by] 
setup[:redirect]=true
session[:sort_by]
else
nil 
end
setup
end
end



