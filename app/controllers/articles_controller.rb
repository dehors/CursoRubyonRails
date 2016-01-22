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
	def edit
		@articles = Article.find(params[:id])
	end
	def update
		@articles = Article.find(params[:id])
		if @articles.update(article_params)
		redirect_to @articles
		else 
		render :edit
		end
	end
	def create
		@articles = current_user.articles.new(article_params)		
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