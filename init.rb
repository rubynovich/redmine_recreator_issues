require 'redmine'

Redmine::Plugin.register :redmine_recreator_issues do
  name 'Пересоздатель задач'
  author 'Roman Shipiev'
  description 'Пересоздает задачи (issues), которые имеют периодическую структуру (релиз, отчетность, встречи). Модуль реализован в виде rake-задачи redmine:recreate_issue, которой нужно лишь указать нужную задачу/задачи.'
  version '0.0.2'
  url 'https://github.com/rubynovich/redmine_recreator_issues'
  author_url 'http://roman.shipiev.me'
end
