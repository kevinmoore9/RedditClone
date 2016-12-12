# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  author_id  :integer          not null
#  sub_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ActiveRecord::Base

  # validates :sub_id, presence: true

  belongs_to :sub

  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: :User

  has_many :post_subs, dependent: :destroy, inverse_of: :post

  has_many :subs,
    through: :post_subs,
    source: :sub

  has_many :comments
    


end
