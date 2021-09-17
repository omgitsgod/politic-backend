class ZipsController < ApplicationController
  
  def get_zip

    lat = params[:lat]
    long = params[:long]
    host = ENV['geo_host']
    key = ENV['geo_key']
    url = "#{host}?prox=#{lat}%2C#{long}%2C250&mode=retrieveAddresses&maxresults=1&gen=9&#{key}"
    response = RestClient.get(url)
    render json: response
  end
end