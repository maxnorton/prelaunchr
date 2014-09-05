# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
Prelaunchr::Application.config.secret_token = ENV["RAILS_SECRET"] || 'd032ee0508b72d5e32f9a3efab327aac789cac38c3715063ee10d7cc9299dd91b7ec65a09488a42599eb97222747a3dc150c1c1a2afe9a398a757ccac35c637c'