feature "Adding a new bookmark" do
  scenario "User can add a bookmark" do
    visit('/bookmarks/new')
    fill_in('url', with: "http://www.example.org")
    fill_in('title', with: 'Test Bookmark')
    click_button('Submit')
    expect(page).to have_link('Test Bookmark', href: 'http://www.example.org')
  end
end
