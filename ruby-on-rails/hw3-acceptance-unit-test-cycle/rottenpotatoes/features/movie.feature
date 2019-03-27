Feature: add/remove movie information

  As a movie fan
  So that I can keep the list of movie I want
  I want to add or remove movie

  Background: movies in database

    Given the following movies

      | title        | rating | director     | release_date |
      | Star Wars    | PG     | George Lucas |   1977-05-25 |
      | Blade Runner | PG     | Ridley Scott |   1982-06-25 |
      | Alien        | R      |              |   1979-05-25 |
      | THX-1138     | R      | George Lucas |   1971-03-11 |
      | Annabelle    | R      |              |   2014-10-03 |

  Scenario: add a movie to the list
    Given I am on the home page
    When I follow "Add new movie"
    Then I should be on the create new movie page
    And I fill in "Title" with "Inception"
    And I press "Save Changes"
    Then I should be on the home page
    And I should see "Inception"

  Scenario: remove a movie from the list
    Given I am on the details page for "Annabelle"
    When I press "Delete"
    Then I should be on the home page
    And I should see "'Annabelle' deleted"