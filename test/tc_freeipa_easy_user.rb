require "test/unit"
require_relative "../lib/freeipa_easy/user.rb"
 
class TestFreeipaEasy < Test::Unit::TestCase
 
  def test_simple
    test = FreeipaEasy::User.new("https://localhost","admin","Passw0rd")
    assert_equal(true, test.authentication_password)
    assert_equal(nil, test.show_user("admin"))
    assert_equal(nil, test.delete_user("test"))
    assert_equal(nil, test.add_user("test", "test", "test", "test@gmail.com", "Tes!ts1"))
    assert_equal(nil, test.modify_user("test", {:mail => "test3@gmail.com"}))
    assert_equal(nil, test.disable_user("test"))
    assert_equal(nil, test.enable_user("test"))
    assert_equal(nil, test.unlock_user("test"))
 end 
  
end
