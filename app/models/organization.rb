class Organization < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :organizations, through: :memberships
end
