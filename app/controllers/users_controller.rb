class UsersController < ApiController
  def index
    @users = User.select('id', 'email', 'business_name', 'first_name', 'last_name').all
    render json: @users
  end

  def show
    @user = User.find(params[:id])
    render json: @user.to_json(:except => [:created_at, :updated_at], :include =>
      {:locales => {:except => [:user_id, :created_at, :updated_at], :include =>
        {:sites => {:only => [:platform_id, :url, :priority, :rating]}
      }
    }})
  end
end
