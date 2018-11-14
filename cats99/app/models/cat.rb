# == Schema Information
#
# Table name: cats
#
#  id          :bigint(8)        not null, primary key
#  birth_date  :date             not null
#  color       :text             not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Cat < ApplicationRecord
  include ActionView::Helpers::DateHelper

  COLORS = ['black', 'white', 'brown', 'orange', 'gray']

  validates :birth_date, :name, :description, presence: true
  validates :color, presence: true, inclusion: {in: COLORS}
  validates :sex, presence: true, inclusion: {in: %w(M F)}
  def age
    (Time.now.to_date - :birth_date)/365
  end


end
