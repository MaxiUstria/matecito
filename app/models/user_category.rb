# == Schema Information
#
# Table name: user_categories
#
#  id          :bigint           not null, primary key
#  user_id     :bigint           not null
#  category_id :bigint           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_user_categories_on_category_id              (category_id)
#  index_user_categories_on_user_id                  (user_id)
#  index_user_categories_on_user_id_and_category_id  (user_id,category_id) UNIQUE
#
class UserCategory < ApplicationRecord
  belongs_to :user
  belongs_to :category

  validates :category, uniqueness: { scope: :user_id }
end
