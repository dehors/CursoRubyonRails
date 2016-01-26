class Article < ActiveRecord::Base
	validates :title, presence: true, uniqueness: true
	validates :body, presence: true , length: {  minimum: 5 , message: "%{value} You must have minimum 5 characters"}
	belongs_to :user
	has_many :comments
	mount_uploader :avatars, AvatarUploader
	after_commit :remove_avatars!, on: :destroy
	after_commit :remove_previously_stored_avatar, on: :update
	before_create :set_visits_count

	def update_visits_count
		self.update(visits_count: self.visits_count + 1)
	end

	
	private


	def set_visits_count
		self.visits_count = 0
	end
end
