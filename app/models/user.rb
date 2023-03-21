class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }   #@を含む必要、一意性である

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i      #値の一致が必須
  validates :password, presence: true, length: { minimum: 6}, format: { with: VALID_PASSWORD_REGEX }
  
  validates :nickname, presence: true 

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]/  } do
    validates :firstname   #全角（漢字・ひらがな・カタカナ）での入力が必須
    validates :lastname    #全角（漢字・ひらがな・カタカナ）での入力が必須
  end

  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/ } do
    validates :firstname_kana   #全角（カタカナ）での入力が必須
    validates :lastname_kana    #全角（カタカナ）での入力が必須
  end

  validates :birthday, presence: true

  has_many :purchase_records
  has_many :items
end
