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
		@articles = Article.new(article_params)		
		@articles.save

		if @articles.save
    		redirect_to @articles
        else
        	render :new 
       end		
	end
	def destroy
		@article = Article.find(params[:id])
	    @article.destroy
	    redirect_to articles_path
	end

	private 

	def article_params
       params.require(:article).permit(:title, :body)
    end

end