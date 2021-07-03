require 'rails_helper'

RSpec.describe 'PageViews' do

  it "show the number of page views" do
    visit "/welcome/index"
    expect(page.text).to match(/This page has been viewed [0-9]+ time/)
  end

  it "is enhacned with JavaScript on", js: true do
    visit "/welcome/index"
    expect(page).to have_text(("ENHANCED!"))
  end

end