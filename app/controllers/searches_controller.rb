class SearchesController < ApplicationController
  
  def index
  	render('index')
  end

  def forecast
  	@data = params[:data][:city]
  	puts @data
  	render('forecast')
  end

  def detail
  end

  private

  	def search_params
  		params.require(:city).permit(:city, :unit)
  	end


end
