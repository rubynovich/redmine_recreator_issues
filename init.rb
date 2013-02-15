require 'redmine'

Redmine::Plugin.register :redmine_recreator_issues do
  name 'Recreator issues'
  author 'Roman Shipiev'
  description 'This plugin add new tasks for re-create issues (with reset old status, and recalculation start_date and due_date, and without attachments). Useful for repetitive issues'
  version '0.0.2'
  url 'https://github.com/rubynovich/redmine_recreator_issues'
  author_url 'http://roman.shipiev.me'
end
