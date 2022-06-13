class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :orders

  with_options presence: true do
    validates :nickname
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, allow_blank: true }
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, allow_blank: true }
    validates :kana_last_name, format: { with: /\A[ァ-ヶー－]+\z/, allow_blank: true }
    validates :kana_first_name, format: { with: /\A[ァ-ヶー－]+\z/, allow_blank: true }
    validates :date_of_birth
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, allow_blank: true
end