class Category < ApplicationRecord
  has_many :questions

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "title", "updated_at"]
  end
end
