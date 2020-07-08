class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :points

  # before_save do
  #   post1=self.posts
  #   self.total=0
  #   post1.point.each do |point1|
  #     self.total+=point1
  #   end
  #   self.average=self.total.fdiv(post1.count)
  # end
end
