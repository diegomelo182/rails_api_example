class Api::V1::UserController < ApplicationController
  def index
    render :json => User.all
  end

  def create
    status = 400
    
    user = User.new(user_params)
    if user.save
      status = 200
    end

    render :nothing => true, :status => status, :content_type => 'text/html'
  end

  def show
    render :json => User.find_by(id: params[:id])
  end

  def update
    status = 400
    user = User.find_by(id: params[:id])

    if user.update(user_params)
      status = 200
    end
  end

  def destroy
    status = 400
    user = User.find_by(id: params[:id])

    if user.delete
      status = 200
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :active)
    end
end
