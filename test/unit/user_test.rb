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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
