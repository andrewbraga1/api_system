# README

This README would contains a summary over this project plus some steps that are necessary to get the
application up and running.

Things you may want to cover:
*For this project we use MVC structure

* Configuration
    -ruby '2.4.9'
    -gem 'rails', '~> 5.2.6'
    Sqlite3 as the database for Active Record
    -gem 'rack-cors'
    -gem 'rack-attack'
    -gem 'shoulda', '~> 4.0'
    -gem 'discard', '~> 1.2'
* Database creation
    rails db:create db:migrate
    rails db:create db:migrate, in case you want to drop db


* How to run the test suite
    bin/rails test test/models/laboratory_exam_test.rb
    bin/rails test test/models/laboratory_test.rb
    bin/rails test test/models/exam_test.rb

* Deployment instructions
    rails s -b 0.0.0.0 -p 3000

* It was implemented a search method
for Laboratory => valid paramenters are name, address, status;
for Exam  => valid paramenters name, typo, status

* In order to implement soft delete
    gem 'discard', '~> 1.2'

* Test cases
    Minitest
    gem 'shoulda', '~> 4.0'
