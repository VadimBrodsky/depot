class Order < ActiveRecord::Base
  PAYMENT_TYPES = ['Check', 'Credit Card', 'Purchase Order']

  validates :name, :address, :email, presence: ture
  validates :pay_type, inclusion: PAYMENT_TYPES
end
