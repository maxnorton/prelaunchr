module ApplicationHelper
  def get_referrer_count
    User.where("referrer_id is not null").count
  end
  def get_all_user_count
    User.all.count
  end
  def get_referral_avg
  	avg = (get_referrer_count.to_f + get_all_user_count.to_f) / get_all_user_count.to_f
  end
end
