class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :index]
  before_action :set_events, only: [:create]
  before_action :set_child, only: [:index, :done]

  def index
    if user_signed_in?
      @events = Event.where(user_id: current_user)
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event_date = Event.where(date: "#{@event.date}")
    if current_user.id === @event.user_id
      unless @event_date.present?
        if @event.save
          redirect_to "/events/#{@event.id}/done"
        else
          flash.now[:notice] = '成長の記録に失敗しました'
          render 'new'
        end
      else
        flash.now[:notice] = '同じ日にちの投稿が既に存在しています'
        render 'new'
      end
    end
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      flash[:notice] = '成長記録が更新されました'
      redirect_to @event
    else
      flash.now[:notice] = '更新に失敗しました'
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
    params.require(:event).permit(:title, :text, :image, :date).merge(user_id: current_user.id)
  end
  def set_user
    @user = User.find(current_user.id)
  end

  def set_child
    @child = Child.find(current_user.id)
  end

  def set_events
    @events = Event.all
  end
end
