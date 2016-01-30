class Article < ActiveRecord::Base
	include AASM

	validates :title, presence: true, uniqueness: true
	validates :body, presence: true , length: {  minimum: 5 , message: "%{value} You must have minimum 5 characters"}
	belongs_to :user
	has_many :comments
	has_many :has_categories
	has_many :categories, through: :has_categories
	mount_uploader :avatars, AvatarUploader
	after_commit :remove_avatars!, on: :destroy
	after_commit :remove_previously_stored_avatar, on: :update
	before_create :set_visits_count
	#validates :avatars, presence: true
	after_create :save_categories
	
	scope :publicados, ->{ where(state: "published") } 

	def categories=(value)
		@categories = value
	end
	def update_visits_count
		self.update(visits_count: self.visits_count + 1)
	end
	def update_categories

		delete = HasCategory.where(article_id: self.id)
		if  delete ||= nil
			delete.each do |del_has_category|
				del_has_category.destroy
			end

		end
	    if  @categories ||= nil
			@categories.each do |category_id|
			HasCategory.create(category_id: category_id,article_id: self.id)
			end
		end
	end

	aasm column: "state" do
		state :in_draft, initial: true
		state :published

		event :publish do
			transitions from: :in_draft, to: :published
		end
		event :unpublish do
			transitions from: :published, to: :in_draft
		end
	end	

	private

	def save_categories
		if  @categories ||= nil
			@categories.each do |category_id|
			HasCategory.create(category_id: category_id,article_id: self.id)
			end
		end
	end

	def set_visits_count
		self.visits_count = 0
	end
end
