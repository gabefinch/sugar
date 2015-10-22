Given(/^no data for today$/) do
  Entry.all.each {|e| e.delete}
end

When(/^I click "(.*?)" on the "(.*?)" page$/) do |text, page|
  visit "/"
  click_link text
end

Then(/^I am told there is insufficient data for reports$/) do
  expect(page).to have_content("Insufficient data")
end
