class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  has_secure_password

  # Will revert the transaction if an error is raised
  after_destroy :ensure_an_admin_remains

  private

  # This exception will be signaled back to the controller
  # To avoid this use the ActiveRecord::Base.transaction exception
  def ensure_an_admin_remains
    if User.count.zero?
      raise "Can't delete last user"
    end
  end
end
