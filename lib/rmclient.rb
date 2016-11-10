require "rmclient/version"

module Rmclient
  # Your code goes here...
  # set up REST stuff 
  class RestAPI < ActiveResource::Base
    self._headers = { 'X-Redmine-API-Key' => Apikey}
  end
  RestAPI.site =  @site

  class Issue   < RestAPI; end
  Issue.format = ActiveResource::Formats::XmlFormat


  class Time_entry < RestAPI
    self.collection_name = 'time_entries'
    self.format = ActiveResource::Formats::XmlFormat
  end

  class Enumeration < RestAPI; end
  class Time_entry_activity < Enumeration
    self.prefix = "/enumerations/"
  end

  # print all issues for user
  def myissues(user = "me", json = false)
    issues = Issue.find(:all, :params => { :assigned_to_id => user, "limit" => 100})
    issues.each{|i| print "#{i.id} #{i.subject}\n"}

  end

  # print possible activities
  def activities()
    Time_entry_activity.find(:all).each{|a| print "#{a.id} #{a.name}\n"}
  end

  # create time entry
  def mktime_entry(id, date, activity, hours, comment)
    # parse date
    begin
      date = Date.parse(date).iso8601
    rescue
      print "Error parsing date \"#{date}\"\n"
    end
    a = Time_entry.new(:issue_id => id, :spent_on => date, :hours => hours, :comments => comment, :activity_id => activity)
    a.save()
  end

end
