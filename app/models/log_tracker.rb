class LogTracker < ActiveRecord::Base
	attr_accessor :visitor_ip, :visitor_url, :visitor_searching_keywords
end
