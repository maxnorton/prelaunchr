class UserMailer < ActionMailer::Base
  default from: "Erickson Woodworking <info@ericksonwoodworking.com>"

  def signup_email(user)
    @user = user
    @twitter_message = "#Shaving is evolving. Excited for @harrys to launch."
    mail(:to => user.email, :subject => "Thanks for signing up!")
  end
end
