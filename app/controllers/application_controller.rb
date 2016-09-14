class ApplicationController < ActionController::Base
  before_action :track_visitor
  before_action :reload_routes
  before_action :configure_permitted_parameters, if: :devise_controller?
  def reload_routes
  	Rails.application.reload_routes!
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def not_found
  	flash[:notice] = "صفحه مورد نظر یافت نشذ"
  end

  def bootstrap_class_for flash_type
      { success: "alert-success", error: "alert-danger", alert: "alert-warning",
       notice: "alert-info" }[flash_type] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do 
              concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
              concat message 
            end)
    end
    nil
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def track_visitor
    if request.remote_ip.exclude?('127.0.0.1')
      @log_tracker = LogTracker.new
      @log_tracker.visitor_ip = request.remote_ip
      (@log_tracker.visitor_ip == '127.0.0.1') ? @log_tracker.visitor_ip : @log_tracker.visitor_url = request.referer
      (@log_tracker.visitor_url =~ /^(https:\/\/google.com)?$/)? 
                      @log_tracker.visitor_searching_keywords = visitor_url[/(?<=q=).+?(?=&)/].split("+") : nil
     @log_tracker.save
    end
  end

end
