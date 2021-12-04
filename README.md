# Pocket Cookbook (backend)

This serves as the backend for the pocket cookbook frontend: https://github.com/damianmalysza/pocket-cookbook-frontend

This backend exposes recipe and category information and also supports POST and DELETE requests to add and delete recipes.

* Ruby version
2.6.1

* Deployment instructions
run 
`` bundle install``

To create database tables run
``` rails db:migrate ```

This app relies on the 8 primary categories that are located in the 'seeds.rb' file. The seed data also randomly creates 100 random recipes. The faker gem is used to generate random ingredients and instructions so the recipes are not actually real. If seed data is not wanted, this should be removed prior to running
``` rails db:seed ```

