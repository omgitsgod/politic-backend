class ArticlesController < ApplicationController
  def index
    articles = Article.all
    render json: articles
  end

  def create
  article = Article.create(article_params)
  end

  private

  def article_params
    params.require(:article).permit(:title, :author, :publishedAt, :url, :urlToImage, :description, :user_id)
  end

end
