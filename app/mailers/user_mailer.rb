class UserMailer < ActionMailer::Base
  default from: "admin@music_app.com"

  def new_user_email(user)
    @new_user = user
    @activation_token = user.generate_activation_token
    @login_url = 'http://localhost:3000/sessions/new'
    @activate_url = "http://localhost:3000/users/activate?activation_token=#{@activation_token}&id=#{@new_user.id}"
    mail(to: user.email, subject: 'Activation Email')
  end
end
