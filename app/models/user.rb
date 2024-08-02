class User < ApplicationRecord
  
  has_one_attached :image
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :books
  
  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end
  end
  
end
