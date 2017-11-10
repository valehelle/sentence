class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable
  before_create :set_nickname
  has_many :feed, :class_name => 'Post', :foreign_key => 'recipient_id'
  include DeviseTokenAuth::Concerns::User

    private
      def set_nickname
        self.nickname = "#{self.email[/^[^@]+/]}#{SecureRandom.hex(1)}"
      end
end
