class ArticlesController < ApplicationController
	before_action :authenticate_user!, only: [:new, :edit]
	before_action :set_article, except: [:index, :new, :create]
	def index
		@articles = Article.all
	end
	def show
		@comment = Comment.new
		@articles.update_visits_count		
	end
	def new
		@articles = Article.new
	end
	def edit
		
	end
	def update
		
		if @articles.update(article_params)
		redirect_to @articles
		else 
		render :edit
		end
	end
	def create
		@articles = current_user.articles.new(article_params)			
	
		if @articles.save
    		redirect_to @articles
        else
        	render :new 
       end		
	end
	def destroy
		
	    @articles.destroy
	    redirect_to articles_path
	end

	private 
	def set_article
		@articles = Article.find(params[:id])
	end
	def article_params
       params.require(:article).permit(:title, :body, :avatars)
    end

end