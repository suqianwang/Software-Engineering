Given (/^movies below$/) do |table|
  movies = table.hashes()
  movies.each do |movie|
    Movie.create!(movie)
  end
end

Then (/^The first item in the movie list should be "([^"]*)"$/) do |movie|
  within ('table#movies > tbody tr:first-child') do
    expect(page).to have_content(movie)
  end
end