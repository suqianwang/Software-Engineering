Given (/^the following movies$/) do |table|
  movies = table.hashes()
  movies.each do |movie|
    Movie.create!(movie)
  end
end