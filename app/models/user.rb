class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, :birthday, :password_confirmation, presence: true
  validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,12}\z/, message: "英数字を両方含み、半角で入力してください" }
  validates :last_name, :first_name,  presence: true, format: { with:/\A[ぁ-んァ-ン一-龥]/, message: "全角の漢字・ひらがな・カタカナで入力してください" }
  validates :last_name_furigana, :first_name_furigana, presence: true, format: { with:/\A[ァ-ヶー－]+\z/, message: "全角のカタカナで入力してください" }
end
