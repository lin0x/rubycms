class Page < ActiveRecord::Base
	belongs_to :user
	validates :slug, :uniqueness => {:allow_blank => true,:case_sensitive => false, :message => "آدرس مورد نظر قبلا استفاده شده است."}
	validates_presence_of :title , :message => "تیتر مطلب نمیتواند خالی باشد"
	mount_uploader :image, ImageUploader

	validates_processing_of :image
	validate :image_size_validation

	private
  		def image_size_validation
    		errors[:image] << "حجم فایل عکس باید کمتر از ۵۰۰ کیلو بایت باشد." if image.size > 0.5.megabytes
  		end
end
