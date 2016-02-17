class ArticlePdf < Prawn::Document
	def initialize(articles)
		super(top_margin: 70)
		#super(top_margin: 70,:page_size => '2A0' )
		#:page_size => [1000, 20000]
		#:page_size => '2A0'
		#:page_layout => :landscape
		@articles  = articles
		articulo
		logo
	end	
	def articulo
		text "Articulo: #{@articles.title}", size: 30, style: :bold
		#text "Articulo: \##{@articles.title}"
	end

	def logo
		logopath = "#{Rails.root}/public/#{@articles.avatars}"
		image logopath, :width=> 197, :height=>197		
		draw_text "#{@articles.body}", :at=> [220,575], size: 22
	end
end

