class SearchesController < ApplicationController


  def index
  	render('index')
  end

  def forecast
  	require 'httparty'

    @apiKey = 'bd2ae3f21976f0f86cc5e88e358b72bd'

  	@target_city = params[:data][:city]
    @unit = params[:data][:unit]

  	target_url = 'http://api.openweathermap.org/data/2.5/forecast/daily?q=' + @target_city + '&units=' + @unit + '&cnt=16&APPID=' + @apiKey
  	response = HTTParty.get(target_url)
  	response.parsed_response
  	puts response.parsed_response
  	@results = response.parsed_response
  	render('forecast')

  end

  private

  	def search_params
  		params.require(:city).permit(:city, :unit)
  	end

  	# def detail_params
  	# 	params.require(:data).permit(:min, :max, :night, :pressure, :main, :description)
  	# end

end
