Given (/^the following movies exist:$/) do |table|
  movies = table.hashes()
  movies.each do |movie|
    Movie.create!(movie)
  end
end

Then (/^the director of "([^"]*)" should be "([^"]*)"$/) do |movie, director|
  expect(page).to have_content(movie)
  expect(page).to have_content("Director: "+director)
end