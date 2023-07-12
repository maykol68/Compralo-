require "test_helper"

class UserMailerTest < ActionMailer::TestCase
  def setup
    @user = User.last
  end
  test "welcome" do
    mail = UserMailer.with(user: @user).welcome
    assert_equal "Bienvenido a COMPRALO", mail.subject
    assert_equal [@user.email], mail.to
    assert_equal ["no-reply@compralo.com"], mail.from
    assert_match "Hola #{@user.username}, Bienvenido a COMPRALO. Esperamos que compres demasiado!", mail.body.encoded
  end

end
