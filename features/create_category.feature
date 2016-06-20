Feature: Create Category
  As an author
  In order to gift my thoughts to the world
  I want to create a category

  Scenario: I can create category
    Given the blog is set up
    And I am logged into the admin panel
    And I am on the category page
    When I fill in "category_name" with "Foobar"
    And I fill in "category_keywords" with "Lorem Ipsum"
    And I fill in "category_permalink" with "Lorem Ipsum"
    And I fill in "category_description" with "Lorem Ipsum"
    And I press "Save"
    Then I should be on the category page
    Then I should see "Foobar"
    Then I should see "Lorem Ipsum"
    
  Scenario: I cannot create category
    Given the blog is set up
    And I am logged into the admin panel
    And I am on the category page
    When I fill in "category_name" with "Foobar"
    And I press "Save"
    Then I should be on the category page

