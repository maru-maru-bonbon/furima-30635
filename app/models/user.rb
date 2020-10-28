class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX
         
         validates :nickname, presence: true
      with_options presence: true, format: { with: /\A[ぁ-んぁ一-龥]+\z/, message: '全角文字を使用してください' } do
         validates :last_name, presence: true
         validates :first_name, presence: true
      end
      
      with_options presence: true, format: { with: /\A[ァ-ン]+\z/, message: '全角文字を使用してください' } do
         validates :last_katakana, presence: true
         validates :first_katakana, presence: true
      end
         validates :birthday, presence: true


end
