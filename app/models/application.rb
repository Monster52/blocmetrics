class Application < ActiveRecord::Base
  belongs_to :user

  has_many :events, dependent: :destroy

  def home_page
    self.events.where(name: "home page").count
  end

  def topics_page
    self.events.where(name: "topics page").count
  end

  def bookmarks_page
    self.events.where(name: "bookmarks page").count
  end

  def users_page
    self.events.where(name: "user page").count
  end
end
