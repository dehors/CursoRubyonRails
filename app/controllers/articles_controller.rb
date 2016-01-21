class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end
	def show
		@articles = Article.find(params[:id])		
	end
	def new
		@articles = Article.new
	end
	def create
		@articles = Article.new(title: params[:article][:title], body: params[:article][:body])		
		@articles.save

		if @articles.save
    		redirect_to @articles
        else
        	render :new 
       end		
	end
end