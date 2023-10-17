require "test_helper"

class MessageThreadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message_thread = message_threads(:one)
  end

  test "should get index" do
    get message_threads_url, as: :json
    assert_response :success
  end

  test "should create message_thread" do
    assert_difference("MessageThread.count") do
      post message_threads_url, params: { message_thread: { message_id: @message_thread.message_id, post_id: @message_thread.post_id } }, as: :json
    end

    assert_response :created
  end

  test "should show message_thread" do
    get message_thread_url(@message_thread), as: :json
    assert_response :success
  end

  test "should update message_thread" do
    patch message_thread_url(@message_thread), params: { message_thread: { message_id: @message_thread.message_id, post_id: @message_thread.post_id } }, as: :json
    assert_response :success
  end

  test "should destroy message_thread" do
    assert_difference("MessageThread.count", -1) do
      delete message_thread_url(@message_thread), as: :json
    end

    assert_response :no_content
  end
end
