module ObjectsFramework
	module FormHelper
		def initialize
			@form_helper_errors = []
		end

		def params_present?(*fields)
			test_is_not_failed = true
			fields.each do |field|
				if(!respond_to?(field))
					@form_helper_errors << {field: field, message: "Required field", status: "fieldnotfound"}
					test_is_not_failed = false
				elsif(send(field).empty?)
					@form_helper_errors << {field: field, message: "Required field", status: "emptyfield"}
					test_is_not_failed = false
				end
			end
			return test_is_not_failed
		end
		# More tests coming soon (like check file type, check date format, etc..., request them at github.com/bramvdbogaerde/objectsframework-formhelper/issues)
	end
end

# # Example usage:
# require 'objectsframework/formhelper'
# class Post < ObjectsFramework::Object
# 	# POST /post/new
# 	def post_new
# 		if(params_present? :title, :content, :tags)
# 			# write to database for example
# 		else
# 			# error
# 		end
# 	end
# end
