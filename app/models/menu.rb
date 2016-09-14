class Menu < ActiveRecord::Base
	has_many :mitems

	accepts_nested_attributes_for :mitems, reject_if: :all_blank, allow_destroy: true
end
