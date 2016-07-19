class Application < ActiveRecord::Base
  belongs_to :user

  has_many :events, dependent: :destroy

  def user_visit_count
    self.events.where(name: "users").count
  end

  def page_views_count
    self.events.where(name: "page views").count
  end
end
