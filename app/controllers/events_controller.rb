class EventsController < ApplicationController
   layout "admin"   
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => :create
  respond_to :html

  def index
    @events = Event.all

    respond_to do |format|
         format.html {respond_with(@event)}
         format.json {@event}     
    end
  end

  def show
    respond_with(@event)
  end

  def new
    
  end

  def edit
  end

  def create
    @event  = Event.new(event_params)    
    
      if  @event.save        
          render json: @event, status: 201
      else
         format.json {render :json, @event.errors, status: 500 }
      end
    
  end

  def update
    @event.update(event_params)
    respond_with(@event)
  end

  def destroy
    @event.destroy
    respond_with(@event)
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:body)
    end
end
