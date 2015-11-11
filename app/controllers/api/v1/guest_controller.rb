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

    json_return['query_info'] = { 
      'offset' => params[:offset] ? params[:offset].to_i : 0,
      'limit' => params[:limit] ? params[:limit].to_i : 0,
      'counter' => all_guests.length,
    }
    json_return['query_return'] = all_guests

    render :json => json_return
  end

  def create
    status = 401

    guest = Guest.new(guest_params)
    if guest.valid?
      if guest.save
        status = 201
        response.headers["Location"] = "/api/v1/guests/#{guest.id}" # header response
      end
    end

    render :nothing => true, :status => status, :content_type => 'text/html'
  end

  def show
    json_return = Hash.new
    status = 400
    guest = Guest.find_by(id: params[:id])

    if guest
      status = 200
      json_return = guest
    else
      json_return = {"error" => "Usuário não encontrado"}
    end

    render :json => json_return, :status => status
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
