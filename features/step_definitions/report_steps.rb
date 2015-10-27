Given(/^no data for today$/) do
  Entry.all.each {|e| e.delete}
end

When(/^I click "(.*?)" on the "(.*?)" page$/) do |text, page|
  visit "/"
  click_link text
end

Given(/^an entry for today of "(.*?)"$/) do |value|
  visit "/"
  click_link 'Glucose Reading'
  fill_in 'entry_value', :with => value
  click_button 'Create Entry'
end

Then(/^I am shown "(.*?)"$/) do |message|
  expect(page).to have_content(message)
end
