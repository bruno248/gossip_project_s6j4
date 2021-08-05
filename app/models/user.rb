class User < ApplicationRecord
    has_secure_password
    belongs_to :city 
    has_many :gossips
  
    validates :first_name, presence: true
    validates :email,
      presence: true,
      uniqueness: true,
      format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "Veuillez rentrer l'adresse mail" }
    
    validates :password,
    presence: true

    validate :age_is_real
  
  
    def age_is_real
      errors.add(:age, 'This age isn\'t possible')unless age > 0 && age < 100
    end
  
  end