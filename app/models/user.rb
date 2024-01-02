class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
         has_many :post
         has_many :comment
         validates :user_name, presence: true, uniqueness: true
         validates :Phone_number, presence: true, length: { minimum: 10, maximum: 15 }
          validates :gender, inclusion: { in: %w(male female other), message: "must be male, female, or other" }
          

end
