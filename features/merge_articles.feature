Feature: Merge Articles
  As a blog administrator
  In order to share similar thoughts among different articles
  I want to be able to merge articles into one
    
Background:
    Given the blog is set up
    And the following users are present:
    | name      | profile   |
    | Nick      | publisher |
    | Other     | publisher |
    And the following articles exist:
    | title        | body       | author |
    | Star Wars    | Check this | Nick   |
    | Blade Runner | stuff out  | Other  |

Scenario: Can't merge if I am a publisher
    And I am logged into the publisher panel
    And I am on the edit page for "Star Wars"
    Then I should not see "Merge"
    
Scenario: Do not see merge on new item page
    Given I am logged into the admin panel
    And I am on the new article page
    Then I should not see "Merge"

Scenario: Successful Merge - body
    Given I am logged into the admin panel
    And I am on the edit page for "Star Wars"
    When I fill in "merge_with" with the "Blade Runner" id
    And I press "Merge"
    Then I should be on the article index page
    And I should see "Star Wars"
    And I should not see "Blade Runner"
    When I follow "Edit"
    Then I should see "Check this"
    And I should see "stuff out"
    
Scenario: Successful Merge - comments
    Given I am logged into the admin panel
    And "Star Wars" has 9 comments
    And "Blade Runner" has 9 comments
    And I am on the edit page for "Star Wars"
    When I fill in "merge_with" with the "Blade Runner" id
    And I press "Merge"
    Then I should be on the article index page
    And I should see "18"
    
Scenario: Unsuccessful Merge - Same ID
    Given I am logged into the admin panel
    And I am on the edit page for "Star Wars"
    When I fill in "merge_with" with the "Star Wars" id
    And I press "Merge"
    Then I should be on the edit page for "Star Wars"
    And I should see "You need to enter a DIFFERENT ID in order to merge"
    
Scenario: Unsuccessful Merge - Nonexistent ID
    Given I am logged into the admin panel
    And I am on the edit page for "Star Wars"
    When I fill in "merge_with" with "7"
    And I press "Merge"
    Then I should be on the edit page for "Star Wars"
    And I should see "Article ID 7 does not exist"
    
  

    

    
