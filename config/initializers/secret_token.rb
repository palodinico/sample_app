# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.


### SampleApp::Application.config.secret_key_base = 'a8f414e8761ad2f17229c343ce28a31815196fa0f58ed44301a27ccb878bc5c8a3546b6f8f0b83ad4fbf7c5c4042d65e6dbd6c16ee8e9d8b8cc584db2a2fccf7'

require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
  	File.read(token_file).chomp
  else
  	token = SecureRandom.hex(64)
  	File.write(token_file, token)
  end
end

SampleApp::Application.config.secret_key_base = secure_token
