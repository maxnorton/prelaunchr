ActiveAdmin.register User do
  actions :index, :show

  preserve_default_filters!
  filter :referrer, collection: User.all.map{ |user| [user.email, user.id] }
  filter :referrals, collection: User.all.map{ |user| [user.email, user.id] }

  index do 
  	column :id
  	column("Name") 				{ |user| user.first_name + " " + user.last_name }
 	column :email
  	column("Referrer", :referrer, :sortable => :referrer_id)
  	column :referral_code
  	column("Created at", :created_at, :sortable => :created_at)
  	column("Referral count") 	{ |user| user.referrals.count }
  	actions
  end

  csv do 
    column :id
    column("Name")        { |user| user.first_name + " " + user.last_name }
    column :email
    column :referral_code
    column("Created at")  { |user| user.created_at }
    column("Referral count")  { |user| user.referrals.count }
  end
end
