Given /(.*) entries so far today/ do |entries|
  Entry.all.each {|e| e.delete}
  entries.to_i.times do
    Entry.create(:value => "100")
  end
end

When(/^I submit an entry from the Glucose Reading form page$/) do
  visit "/"
  click_link 'Glucose Reading'
  fill_in 'entry_value', :with => '90'
  click_button 'Create Entry'
end

Then(/^I am returned to the index page$/) do
  expect(page).to have_xpath('/')
end

Then(/^I am given an accurate readout of how many readings I have entered today$/) do
  expect(page).to have_content('4 entries today.')
end

Then(/^I am told that I already have 4 entries$/) do
  expect(page).to have_content('Value exceeds the number of allowed entries (4/day).')
end

When(/^I submit an entry with blank value$/) do
  visit "/"
  click_link 'Glucose Reading'
  click_button 'Create Entry'
end

When(/^I am told that my entry "(.*?)"$/) do |message|
  expect(page).to have_content(message)
end

When(/^I submit an entry with value of "(.*?)"$/) do |value|
  visit "/"
  click_link 'Glucose Reading'
  fill_in 'entry_value', :with => value
  click_button 'Create Entry'
end
