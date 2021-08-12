feature "Adding a new bookmark" do
  scenario "User can add a bookmark" do
    visit('/bookmarks/new')
    fill_in('url', with: "https://www.example.com")
    click_button('Submit')
    expect(page).to have_content "https://www.example.com"
  end
end
