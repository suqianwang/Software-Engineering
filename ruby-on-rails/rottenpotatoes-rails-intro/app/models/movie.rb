class Movie < ActiveRecord::Base

# grab a single record per unique value in the field 'rating'
  def self.get_ratings
    self.pluck(:rating)
  end

end
# automated mapping between class - Movie and table - movies and its attributes and columns
