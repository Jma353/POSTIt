class Post < ActiveRecord::Base
	validates :postName, presence: true, 
												 	length: { minimum: 5, 
																		maximum: 15, 
																		too_short: "Must have at least %{count} characters",
																		too_long: "Must have maximum %{count} characters" }
	validates :content, presence: true, length: { minimum: 10 }
	validates :poster, presence: true, length: { minimum: 10 }
		

end
