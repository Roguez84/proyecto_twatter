class Api::NewsController < ActionController::API # En clase se uso: ApplicationController < ActionController::API
  #include ActionController::HttpAuthentication::Basic::ControllerMethods
  #http_basic_authenticate_with name: "", password: "", except: :index
  #before_action :authenticate_user!


  def index
    #@news = Twat.all
    @news = Twat.select(:id,:name,:user_id).order('created_at DESC').limit(50)


#    respond_to do |format|
#      format.json {render :json => @news.to_json, :status => :ok}
#    end
    render json: @news
#    render json: @news.to_json(include: [])
  end

  #Twat.where(user_id:user.id).count

  def create
    @twat = Twat.new(twat_params.merge(user: current_user))

    if @twat.save
      render json: @twat, status: :created, location: @twat
      #format.json { render :show, status: :created, location: @twat }
    else
      #render json: @twat.errors, status: :unprocessable_entity
      #format.json { render json: @twat.errors, status: :unprocessable_entity }
      render json: twat_params#.merge(user: current_user)
    end

  end
  private
  # Use callbacks to share common setup or constraints between actions.
#  def set_post
#    @post = Post.find(params[:id])
#  end

  # Only allow a trusted parameter "white list" through.
  def twat_params
    params.require(:twat).permit(:name)
  end

end

#like_count
#retweets_count
#retweeted_from
