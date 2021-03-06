class TwatsController < ApplicationController
  before_action :set_twat, only: %i[ show edit update destroy ]
  before_action :authenticate_user!


  # GET /twats or /twats.json
  def index
    #@twats = Twat.all
    #@twats = Twat.page(params[:page]) Esto era antes de restringir a que se vieran los twats de los friends
    #@twats_from_friends = Twat.tweets_for_me(current_user.id).page(params[:page])
    @likes = Like.all
    if params[:name].present?
      @twats_from_friends = Twat.tweets_for_me(current_user.id).where('name like ?', "%#{params[:name]}%").page(params[:page])
    else
      @twats_from_friends = Twat.tweets_for_me(current_user.id).page(params[:page])
    end


  end

  # GET /twats/1 or /twats/1.json
  def show
  end

  # GET /twats/new
  def new
    @twat = Twat.new
  end

  # GET /twats/1/edit
  def edit
  end

  # POST /twats or /twats.json
  def create
    #@twat = Twat.new(twat_params)
    @twat = Twat.new(twat_params.merge(user: current_user))

    ##Hecho en clase: para cambiar el mensaje de bienvenida
    # if @post.saved
    # => redirect_to root_path, notice: 'Post creado'
    #else
    # => redirect_to root_path, alert: 'No pude crear el post'
    #end

    respond_to do |format|
      if @twat.save
        format.html { redirect_to @twat, notice: "Twat was successfully created." }
        format.json { render :show, status: :created, location: @twat }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @twat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /twats/1 or /twats/1.json
  def update
    respond_to do |format|
      if @twat.update(twat_params)
        format.html { redirect_to @twat, notice: "Twat was successfully updated." }
        format.json { render :show, status: :ok, location: @twat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @twat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twats/1 or /twats/1.json
  def destroy
    @twat.destroy
    respond_to do |format|
      format.html { redirect_to twats_url, notice: "Twat was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def like
    #grabbing the twat
    @twat = Twat.all.find(params[:id])
    #creating a Like with that post and the current user's id
    Like.create(user_id: current_user.id, twat_id: @twat.id)
    #redirecting them back to that POST
    redirect_to twat_path(@twat)
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_twat
      @twat = Twat.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def twat_params
      params.require(:twat).permit(:name)
      #Es similar a :
      # return {
      # => name: params[:post][:name]
      # => }
    end
end

#params dentro de params, viene lo siguiente
# {
#   auth_token: 'acsafasefa'
#   utf: 'si',
#   post: {
#     nombre_variable1: 'nose'
#     nombre_variable2: 'nose'
#   }
# }
