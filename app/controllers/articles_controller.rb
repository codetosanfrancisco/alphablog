class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end
	def show
		@article = Article.find(params[:id])
	end
	def new
		@article = Article.new
	end
	def create
		@article = Article.new(article_params)
		if @article.save
			flash[:notice] = "Article is successfully added!"
			redirect_to articles_path(@article)
		else
			render 'new'
		end
	end
	def edit
		@article = Article.find(params[:id])
	end
	def update
		@article = Article.find(params[:id])
		if @article.update_attributes(article_params)
			flash[:notice] = "Article is successfully updated!"
			redirect_to articles_path(@article)
		else
			render 'edit'
		end
	end
	def destroy
		@article = Article.find(params[:id])
		if @article.delete
			flash[:notice] = "Article is successfully deleted!"
		else
			flash[:notice] = "Delete unsuccessful!"
		end
		redirect_to articles_path
	end
	private
	def article_params
		params.require(:article).permit(:title, :description)
	end
end
