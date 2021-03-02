class HomeController < ApplicationController
  def index
    #@twats = Twat.all
    @twats = Twat.page(params[:page])
    @likes = Like.all

  end
end
