# FreeipaEasy

Welcome to Freeipa Easy! 

You can use this gem to easy connect to free ipa system and wok with users in this system/

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'freeipa_easy'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install freeipa_easy

## Usage
1) Create object:
test_con = FreeipaEasy::User("http://localhost", "admin", "pass") 
2) Authorization
test_con.authorization_password
3)Add user
test_con.add_user(first_name,second_name,email@com, login,password)
2)Modify user
test_con.modify_user(login,{:email => "test2@mail.com})
3) And etc
test_con.disable_user(login)
test_con.u_usernlock(login)
test_con.delete(login)


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/arnikasky/freeipa_easy.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

