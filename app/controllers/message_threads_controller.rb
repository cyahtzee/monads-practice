class MessageThreadsController < ApplicationController
  before_action :set_message_thread, only: %i[ show update destroy ]

  # GET /message_threads
  def index
    @message_threads = MessageThread.all

    render json: @message_threads
  end

  # GET /message_threads/1
  def show
    render json: @message_thread
  end

  # POST /message_threads
  def create
    @message_thread = MessageThread.new(message_thread_params)

    if @message_thread.save
      render json: @message_thread, status: :created, location: @message_thread
    else
      render json: @message_thread.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /message_threads/1
  def update
    if @message_thread.update(message_thread_params)
      render json: @message_thread
    else
      render json: @message_thread.errors, status: :unprocessable_entity
    end
  end

  # DELETE /message_threads/1
  def destroy
    @message_thread.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message_thread
      @message_thread = MessageThread.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_thread_params
      params.require(:message_thread).permit(:post_id, :message_id)
    end
end
