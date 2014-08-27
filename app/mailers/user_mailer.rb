class UserMailer < ActionMailer::Base
  default from: "Harry's <welcome@harrys.com>"

  def signup_email(user,host)
    @user = user
    @twitter_message = "#Shaving is evolving. Excited for @harrys to launch."
    @host = host
    mail(:to => user.email, :subject => "Thanks for signing up!")
  end
end
