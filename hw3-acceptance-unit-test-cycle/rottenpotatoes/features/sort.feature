Feature: add/remove movie information

  As a user of this tool
  So that I can organize my movie list
  I want to be able to sort and filter movies

  Background: movies in database

    Given movies below

      | title        | rating | director     | release_date |
      | Star Wars    | PG     | George Lucas |   1977-05-25 |
      | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
      | Alien        | R      |              |   1979-05-25 |
      | THX-1138     | R      | George Lucas |   1971-03-11 |
      | Annabelle    | R      |              |   2014-10-03 |

  Scenario: sort movies by title
    Given I am on the home page
    When I follow "Movie Title"
    Then The first item in the movie list should be "Alien"

  Scenario: sort movies by release date
    Given I am on the home page
    When I follow "Release Date"
    Then The first item in the movie list should be "THX-1138"