# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  email         :string(255)
#  referral_code :string(255)
#  referrer_id   :integer
#  created_at    :datetime
#  updated_at    :datetime
#  first_name    :string(255)
#  last_name     :string(255)
#

class User < ActiveRecord::Base
    belongs_to :referrer, :class_name => "User", :foreign_key => "referrer_id"
    has_many :referrals, :class_name => "User", :foreign_key => "referrer_id"

    validates :first_name, presence: true, length: { maximum: 100 }
    validates :last_name, presence: true, length: { maximum: 100 }
    validates :email, :presence=>true, :uniqueness => true
    validates :email, :format => { :with => /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/i, :message => "Invalid email format." } , :if => Proc.new {|user| not user.email.blank?}
    validates :referral_code, :uniqueness => true

    before_create :create_referral_code
    # after_create :send_welcome_email

    REFERRAL_STEPS = [
        {
            'count' => 5,
            "html" => "Shave<br>Cream",
            "class" => "two",
            "image" =>  ActionController::Base.helpers.asset_path("refer/cream-tooltip@2x.png")
        },
        {
            'count' => 10,
            "html" => "Truman Handle<br>w/ Blade",
            "class" => "three",
            "image" => ActionController::Base.helpers.asset_path("refer/truman@2x.png")
        },
        {
            'count' => 25,
            "html" => "Winston<br>Shave Set",
            "class" => "four",
            "image" => ActionController::Base.helpers.asset_path("refer/winston@2x.png")
        },
        {
            'count' => 50,
            "html" => "One Year<br>Free Blades",
            "class" => "five",
            "image" => ActionController::Base.helpers.asset_path("refer/blade-explain@2x.png")
        }
    ]

    private

    def create_referral_code
        referral_code = SecureRandom.hex(5)
        @collision = User.find_by_referral_code(referral_code)

        while !@collision.nil?
            referral_code = SecureRandom.hex(5)
            @collision = User.find_by_referral_code(referral_code)
        end

        self.referral_code = referral_code
    end

    def send_welcome_email
        UserMailer.delay.signup_email(self)
    end
end
