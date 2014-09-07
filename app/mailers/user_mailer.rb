class UserMailer < ActionMailer::Base
  default from: "Erickson Woodworking <information@ericksonwoodworking.com>"

  def signup_email(user)
    @user = user
    @twitter_message = "Soon I could be sitting in The Atlantic Monthly’s \"nexus of art and ergonomics\" thanks to @ericksonww."
    mail(:to => user.email, :subject => "Thanks for signing up!")
  end
end
