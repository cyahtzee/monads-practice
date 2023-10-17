class MessageThreadMessagesController < ApplicationController
  before_action :set_message_thread_message, only: %i[ show update destroy ]

  # GET /message_thread_messages
  def index
    @message_thread_messages = MessageThreadMessage.all

    render json: @message_thread_messages
  end

  # GET /message_thread_messages/1
  def show
    render json: @message_thread_message
  end

  # POST /message_thread_messages
  def create
    @message_thread_message = MessageThreadMessage.new(message_thread_message_params)

    if @message_thread_message.save
      render json: @message_thread_message, status: :created, location: @message_thread_message
    else
      render json: @message_thread_message.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /message_thread_messages/1
  def update
    if @message_thread_message.update(message_thread_message_params)
      render json: @message_thread_message
    else
      render json: @message_thread_message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /message_thread_messages/1
  def destroy
    @message_thread_message.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message_thread_message
      @message_thread_message = MessageThreadMessage.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_thread_message_params
      params.require(:message_thread_message).permit(:message_thread_id, :message_id)
    end
end
