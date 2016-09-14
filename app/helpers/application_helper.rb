module ApplicationHelper
	def admin_zone?
		controller.class.name.start_with?('Admin')
	end
	
	def gravatar_image_tag email, alt
    	avatar_url = Digest::MD5.hexdigest(email)
    	url = 'https://gravatar.com/avatar/'+ avatar_url
    	image_tag url
  	end
    
    ARABIC_NUMBERS  = %w(۰ ۱ ۲ ۳ ۴ ۵ ۶ ۷ ۸ ۹)
    def toPersian num 
      num = num.to_s if num.is_a? Integer
      num = num.chars.map{|char| ARABIC_NUMBERS[char.to_i]}.join
  end

  def abbr_post_text body
    regx = body.to_s[/^(.+?)\./]+ "مطالعه ادامه مطلب"
  end

  def enConvertor enNumbers
    persianNumbers = %w(. ۱ ۲ ۳ ۴ ۵ ۶ ۷ ۸ ۹)
    enNumbers.to_s.chars.map{|en| persianNumbers[en.to_i]}.join()
  end
end

