ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :nickname, :photo
  #
  # or
  #
  # permit_params do
  #   permitted = [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :nickname, :photo]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :email
    column :created_at
    column :nickname
    column :photo
    column "# de cuentas seguidas" do |user|
              Friend.where(user_id:user.id).count
            end
    column "# de twats realizados" do |user|
              Twat.where(user_id:user.id).count
            end
    column "# de likes dados" do |user|
              Like.where(user_id:user.id).count
            end
    column "# de retweets" do |user|
            end

    actions
  end


end
