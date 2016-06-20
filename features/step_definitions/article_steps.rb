Given /the following articles exist:/ do |article_table|
    article_table.hashes.each do |article|
        Article.create!(article).publish!
    end
end

When /^(?:|I )fill in "([^"]*)" with the "(.*)" id$/ do |field, value|
  fill_in(field, :with => Article.find_by_title(value).id)
end

Given /"(.*)" has ([0-9]) comments?/ do |title, quantity|
    article = Article.find_by_title(title)
    quantity.to_i.times do |num|
        article.add_comment(:author => 'me', :body => "#{title} - #{num+1}").save
    end
end

Given /the following users are present/ do |users|
    users.hashes.each do |user|
        User.create!(
          :login => user['name'], 
		  :password => "12345",
		  :name => user['name'],
		  :email => "#{user['name'].downcase}@test.com",
		  :profile_id => Profile.find_by_label("#{user['profile']}").id)
    end
end