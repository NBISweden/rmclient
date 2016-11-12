require "rmclient/version"
require "active_resource"

module Rmclient
  # set up REST stuff 
  class RestAPI < ActiveResource::Base
    self.format = ActiveResource::Formats::XmlFormat
  end

  class Issue   < RestAPI; end


  class Time_entry < RestAPI
    self.collection_name = 'time_entries'
  end

  class Enumeration < RestAPI; end
  class Time_entry_activity < Enumeration
    self.prefix = "/enumerations/"
  end

  # print issues assigned to user
  def myissues(user = "me")
    issues = Issue.find(:all, :params => { :assigned_to_id => user, "limit" => 100})
    issues.each{|i| print "#{i.id} #{i.subject}\n"}
  end

  # print time entries for user
  def mytime_entries(user = "me")
    entries = Time_entry.find(:all, :params => { :user_id => user, "limit" => 100})
    entries.each{|e| print "#{e.id} #{i.subject}\n"}
  end
 
  # print possible activities
  def activities()
    Time_entry_activity.find(:all).each{|a| print "#{a.id} #{a.name}\n"}
  end

  # create time entry
  def mktime_entry(id, date, activity, hours, comment)
    # parse date
    a = Time_entry.new(:issue_id => id, :spent_on => date, :hours => hours, :comments => comment, :activity_id => activity)
    a.save()
  end

end
