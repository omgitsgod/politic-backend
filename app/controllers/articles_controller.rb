class ArticlesController < ApplicationController
  def index
    articles = Article.all
    render json: articles
  end

  def create
  article = Article.create(article_params)
  end

  def get_topic
    topic = params[:topic]
    host = ENV['news_host']
    key = ENV['news_key']
    url = "#{news_host}/#{topic}?sources=politico&apiKey=#{key}"
    response = RestClient.get(url)
    render json: response
  end

  def get_pol
    pol = params[:pol]
    host = ENV['news_host']
    key = ENV['news_key']
    url = "#{news_host}/everything?sources=politico&q=#{pol}&apiKey=#{key}"
    response = RestClient.get(url)
    render json: response
  end

  private

  def article_params
    params.require(:article).permit(:title, :author, :publishedAt, :url, :urlToImage, :description, :user_id)
  end

end
