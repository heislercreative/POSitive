class UsersController < ApiController
  def index
    @users = User.select('id', 'email', 'business_name', 'first_name', 'last_name').all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end
end
