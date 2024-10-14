class Question < ApplicationRecord
  belongs_to :category
  has_rich_text :answer

  def self.ransackable_attributes(auth_object = nil)
    ["category_id", "created_at", "id", "question", "answer", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["category", "rich_text_answer"]
  end
end
