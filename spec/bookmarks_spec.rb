require 'pg'
require_relative '../lib/bookmarks.rb'
require 'database_helpers'

describe Bookmarks do 
  it "# all method returns all bookmarks" do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    bookmark = Bookmarks.create(url: "http://www.makersacademy.com", title: "Makers Academy")
    Bookmarks.create(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
    Bookmarks.create(url: "http://www.google.com", title: "Google")
 
    bookmarks = Bookmarks.all
 
    expect(bookmarks.length).to eq 3
    expect(bookmarks.first).to be_a Bookmarks
    expect(bookmarks.first.id).to eq bookmark.id
    expect(bookmarks.first.title).to eq 'Makers Academy'
    expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
  end

  it "creates a bookmark" do
    bookmark = Bookmarks.create(url: 'http://www.example.org', title: 'Test Bookmark')
    persisted_data = persisted_data(id: bookmark.id)

    expect(bookmark).to be_a Bookmarks
    expect(bookmark.id).to eq persisted_data['id']
    expect(bookmark.title).to eq 'Test Bookmark'
    expect(bookmark.url).to eq 'http://www.example.org'
  end
end