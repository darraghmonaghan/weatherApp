class SearchesController < ApplicationController
  
# require 'httparty'

  def index
  	render('index')
  end

  def forecast
  	require 'httparty'

  	target_city = params[:data][:city]
  	puts target_city
  	target_url = 'http://api.openweathermap.org/data/2.5/forecast/daily?q=' + target_city + '&units=metric&cnt=16&APPID=bd2ae3f21976f0f86cc5e88e358b72bd'
  	response = HTTParty.get(target_url)
  	response.parsed_response
  	puts response.parsed_response
  	@results = response.parsed_response

  	render('forecast')

  end

  def detail
  end

  private

  	def search_params
  		params.require(:city).permit(:city, :unit)
  	end


end
