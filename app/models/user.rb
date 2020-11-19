class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_many :items
   has_many :purchase_details

         PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates_format_of :password, with: PASSWORD_REGEX, message: "は半角英数字で入力して下さい"
         
         validates :email, uniqueness: { case_sensitive: false }         
         validates :nickname, presence: true
      with_options presence: true, format: { with: /\A[ぁ-んぁ一-龥]+\z/ ,message: "は全角で入力して下さい"} do
         validates :last_name, presence: true
         validates :first_name, presence: true
      end
      
      with_options presence: true, format: { with: /\A[ァ-ン]+\z/ ,message: "は全角で入力して下さい"} do
         validates :last_katakana, presence: true
         validates :first_katakana, presence: true
      end
         validates :birthday, presence: true


end
