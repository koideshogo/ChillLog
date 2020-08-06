class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :index]
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to "/events/#{@event.id}/done"
    else
      flash.now[:alert] = '成長の記録に失敗しました'
      render 'new'
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event, notice:'成長記録が更新されました'
    else
      flash.now[:alert] = '更新に失敗しました'
      render :edit
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
  end

  def done
    @event = Event.find(params[:id])

  end

  private
  def event_params
    params.require(:event).permit(:title, :text, :image).merge(user_id: current_user.id)
  end
  def set_user
    @user = User.find(current_user.id)
  end
end
