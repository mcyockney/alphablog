class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :show, :destroy]    
    def show
    end
    
    def destroy
        @article.destroy
        flash[:danger] = "Article was removed"
        redirect_to articles_path
        
    end
    
    def new
        @article = Article.new
    end
    
    def edit
    end
    
    def index
        @articles = Article.all
    end
    
    def create
        @article = Article.new(article_params)
        if @article.save
            flash[:success]="Article created"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end
    
    def update
        if @article.update(article_params)
            flash[:success] = "Article was successfully updated"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end 
    
    private
    def article_params
        params.require(:article).permit(:title, :description)
    end
    
    def set_article
        @article = Article.find(params[:id])
    end
    
end
