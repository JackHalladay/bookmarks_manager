feature "bookmarks" do
  scenario "can load page with text" do
    Bookmarks.create(url:'http://www.makersacademy.com')
    Bookmarks.create(url:'http://www.google.com')
    Bookmarks.create(url:'http://www.destroyallsoftware.com')
    visit('/bookmarks')
    expect(page).to have_content('http://www.makersacademy.com')
    expect(page).to have_content('http://www.google.com')
    expect(page).to have_content('http://www.destroyallsoftware.com')
  end
end