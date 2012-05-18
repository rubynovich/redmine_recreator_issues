require 'redmine'

Redmine::Plugin.register :redmine_recreator_issues do
  name 'Redmine Recreator Issues plugin'
  author 'Roman Shipiev'
  description 'Plugin for recreate issues in Redmine (as rake-task)'
  version '0.0.2'
  url 'https://github.com/rubynovich/redmine_recreator_issues'
  author_url 'http://roman.shipiev.me'
end
