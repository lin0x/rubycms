class Post < ActiveRecord::Base
  belongs_to :category
  belongs_to :user

  mount_uploader :image, ImageUploader

	validates_processing_of :image
	validate :image_size_validation

	private
	
  		def image_size_validation
    		errors[:image] << "حجم فایل عکس باید کمتر از ۵۰۰ کیلو بایت باشد." if image.size > 0.5.megabytes
  		end
end
