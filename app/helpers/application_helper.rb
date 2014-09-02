module ApplicationHelper
  def get_referrer_count
    User.where("referrer_id is not null").count
  end
  def get_all_user_count
    User.all.count
  end
end
