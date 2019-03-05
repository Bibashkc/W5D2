# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
    validates :title, presence: true

    belongs_to :author,
    foreign_key: :user_id,
    class_name: :User

    has_many :postsubs,
    class_name: :PostSub,
    foreign_key: :post_id


    has_many :subs,
    through: :postsubs,
    source: :sub
  

end
