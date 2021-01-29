class UserMailer < ActionMailer::Base
    default from: 'MyNote@NoteTakers.com'
    layout 'mailer'

    def welcome_email(user)
        @user = user
        @text = `Hello #{user}, welcome to NoteTakers!`
        mail(to: `#{user.email}`, subject: "Welcome to NoteTakers!")
    end

    def reminder_email(user)
        @user = user
        @text = @user.content
        mail(to: @user.message_email, subject: "Reminder from me!")
    end
  end