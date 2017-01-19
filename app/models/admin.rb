class Admin < ApplicationRecord
  has_many :inspections
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  after_create :send_admin_mail
    def send_admin_mail
      AdminMailer.welcome_email(self).deliver
    end
end
