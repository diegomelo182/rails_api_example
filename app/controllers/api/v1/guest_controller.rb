class Api::V1::GuestController < ApplicationController

  def index
    json_return = Hash.new

    offset = params[:offset] ? params[:offset].to_i : 0
    limit = params[:limit] ? params[:limit].to_i : 0

    if offset == 0 && limit == 0
      all_guests = Guest.all
    else
      all_guests = Guest.limit(limit).offset(offset)
    end

    json_return['info'] = { 
      'offset' => params[:offset] ? params[:offset].to_i : 0,
      'limit' => params[:limit] ? params[:limit].to_i : 0,
      'counter' => all_guests.length,
    }
    json_return['data'] = all_guests

    render :json => json_return
  end

  def create
    status = 401

    guest = Guest.new(guest_params)
    if guest.valid?
      if guest.save
        status = 201
      end
    end

    render :nothing => true, :status => status, :content_type => 'text/html'
  end

  def show
  end

  def update
  end

  def destroy
  end

  private
    def guest_params
      params.require(:guest).permit(:name, :email)
    end

end
