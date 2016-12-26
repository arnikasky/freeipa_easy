module FreeipaEasy
  require 'rest-client'
  require 'json'
   class User
     attr_reader :url, :user, :password, :cookies
     def initialize(url, user, password)
       @url = url
       @user = user
       @password = password
     end

     def authentication_password
       begin
       login_freeipa = RestClient::Request.execute(method: :post, url: url+'/ipa/session/login_password', :verify_ssl => false, :payload => "user=#{@user}&password=#{@password}",
       :headers => {:Referer => url+'/ipa'})
       @cookies = login_freeipa.cookies
       rescue Exception => e
         puts "#{e.class}" +": " +  "#{e.message}"
       end
       true
     end

     def add_user(first_name, last_name, login, mail, password)
       begin
       cn = first_name + " " + last_name
       payload = {"method":"user_add",
       "params":[[login],
       {"cn": cn, "mail": mail, "givenname": first_name, "sn": last_name, "userpassword": password}],
       "id":0}
       data_json = RestClient::Request.execute(method: :post, 
       url: @url +'/ipa/session/json',
       :verify_ssl => false, 
       :cookies => @cookies,
       :payload => payload.to_json,
       :headers => {:content_type => :json, :accept =>:json,
       :Referer => url + '/ipa'})
       data = JSON.parse(data_json)
       rescue Exception => e
         puts "#{e.class}" +": " +  "#{e.message}"
       end
       data["error"]
     end

     def delete_user(login)
       begin
       payload = {"id": 0, "method": "user_del", "params": [[[login]],{ }]}
       data_json = RestClient::Request.execute(method: :post,
       url: @url +'/ipa/session/json',
       :verify_ssl => false,
       :cookies => @cookies,
       :payload => payload.to_json,
       :headers => {:content_type => :json, :accept =>:json,
       :Referer => url + '/ipa'})
       data = JSON.parse(data_json)
       rescue Exception => e
         puts "#{e.class}" +": " +  "#{e.message}"
       end
       data["error"]
     end

     def show_user(login)
       begin
       payload = {"id": 0, "method": "user_show", "params": [[login], {"all": false, "no_members": false,"raw": false,"rights": false}]}
       data_json = RestClient::Request.execute(method: :post,
       url: @url +'/ipa/session/json',
       :verify_ssl => false,
       :cookies => @cookies,
       :payload => payload.to_json,
       :headers => {:content_type => :json, :accept =>:json,
       :Referer => url + '/ipa'})
       data = JSON.parse(data_json)
       rescue Exception => e
         puts "#{e.class}" +": " +  "#{e.message}"
       end
       data["error"]
     end

     def disable_user(login)
       begin
       payload = {"id": 0, "method": "user_disable", "params": [[login], {}]}
       data_json = RestClient::Request.execute(method: :post,
       url: @url +'/ipa/session/json',
       :verify_ssl => false,
       :cookies => @cookies,
       :payload => payload.to_json,
       :headers => {:content_type => :json, :accept =>:json,
       :Referer => url + '/ipa'})
       data = JSON.parse(data_json)
       rescue Exception => e
         puts "#{e.class}" +": " +  "#{e.message}"
       end
       data["error"]
     end

     def unlock_user(login)
       begin
       payload = {"id": 0, "method": "user_unlock", "params": [[login], {}]}
       data_json = RestClient::Request.execute(method: :post,
       url: @url +'/ipa/session/json',
       :verify_ssl => false,
       :cookies => @cookies,
       :payload => payload.to_json,
       :headers => {:content_type => :json, :accept =>:json,
       :Referer => url + '/ipa'})
       data = JSON.parse(data_json)
       rescue Exception => e
         puts "#{e.class}" +": " +  "#{e.message}"
       end
       data["error"]
     end

     def enable_user(login)
       begin
       payload = {"id": 0, "method": "user_enable", "params": [[login], {}]}
       data_json = RestClient::Request.execute(method: :post,
       url: @url +'/ipa/session/json',
       :verify_ssl => false,
       :cookies => @cookies,
       :payload => payload.to_json,
       :headers => {:content_type => :json, :accept =>:json,
       :Referer => url + '/ipa'})
       data = JSON.parse(data_json)
       rescue Exception => e
         puts "#{e.class}" +": " +  "#{e.message}"
       end
       data["error"]
     end

     def modify_user(login,payload_options={})
       begin
       payload_options.merge!({"all": false, "no_members": false,"raw": false,"rights": false})
       test =  {"all": false, "no_members": false,"raw": false,"rights": false}
       payload = {"id": 0, "method": "user_mod", "params": [[login], payload_options]}
       data_json = RestClient::Request.execute(method: :post,
       url: @url +'/ipa/session/json',
       :verify_ssl => false,
       :cookies => @cookies,
       :payload => payload.to_json,
       :headers => {:content_type => :json, :accept =>:json,
       :Referer => url + '/ipa'})
       data = JSON.parse(data_json)
       rescue Exception => e
         puts "#{e.class}" +": " +  "#{e.message}"
       end
      data["error"]
     end

   end
end

