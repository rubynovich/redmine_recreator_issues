# redMine - project management software
# Copyright (C) 2008  Jean-Philippe Lang
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

desc <<-END_DESC
Send reminders about issues due in the next days.

Available options:
  * id     => single id of issue that must be recreated or multiple id of issues listed in the separator (not space)
Example:
  rake redmine:recreate_issue id=123 RAILS_ENV="production"
or
  rake redmine:recreate_issue id=123,456,678 RAILS_ENV="production"
  
END_DESC
require File.expand_path(File.dirname(__FILE__) + "/../../../../../config/environment")


class IssueRecreator
  def self.recreate(issue_id)
    old_issue = Issue.find(issue_id)
    issue = Issue.create(
      :status => IssueStatus.default, 
      :tracker => old_issue.tracker, 
      :subject => old_issue.subject, 
      :project => old_issue.project, 
      :description => old_issue.description, 
      :author => old_issue.author, 
      :start_date => Date.today,
      :due_date => (
        if old_issue.due_date.present?
          Date.today + (old_issue.due_date - old_issue.start_date)
        else
          nil
        end
      ),
      :priority => old_issue.priority,
      :assigned_to => old_issue.assigned_to)
    puts "#{Time.now} - Recreated issue ##{old_issue.id} as ##{issue.id}"
  end
end

namespace :redmine do
  task :recreate_issue => :environment do
    if ENV['id'].present?
      ENV['id'].scan(/\d+/).each do |id|
        IssueRecreator.recreate(id)
      end      
    end
  end
end

