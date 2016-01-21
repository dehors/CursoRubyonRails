class Article < ActiveRecord::Base
	validates :title, presence: true, uniqueness: true
	validates :body, presence: true , length: {  minimum: 5 , message: "%{value} You must have minimum 5 characters"}
end
