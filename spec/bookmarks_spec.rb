require_relative '../lib/bookmarks.rb'

describe Bookmarks do 
  it "# all method returns all bookmarks" do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
    bookmarks = Bookmarks.all

    expect(bookmarks).to include("http://www.makersacademy.com")
    expect(bookmarks).to include("http://www.google.com")
    expect(bookmarks).to include("http://www.destroyallsoftware.com")
  end

  it "creates a bookmark" do
    Bookmarks.create(url: 'https://www.youtube.com/')
    expect(Bookmarks.all).to include('https://www.youtube.com/')
  end
end