require "test_helper"

class MessageThreadMessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message_thread_message = message_thread_messages(:one)
  end

  test "should get index" do
    get message_thread_messages_url, as: :json
    assert_response :success
  end

  test "should create message_thread_message" do
    assert_difference("MessageThreadMessage.count") do
      post message_thread_messages_url, params: { message_thread_message: { message_id: @message_thread_message.message_id, message_thread_id: @message_thread_message.message_thread_id } }, as: :json
    end

    assert_response :created
  end

  test "should show message_thread_message" do
    get message_thread_message_url(@message_thread_message), as: :json
    assert_response :success
  end

  test "should update message_thread_message" do
    patch message_thread_message_url(@message_thread_message), params: { message_thread_message: { message_id: @message_thread_message.message_id, message_thread_id: @message_thread_message.message_thread_id } }, as: :json
    assert_response :success
  end

  test "should destroy message_thread_message" do
    assert_difference("MessageThreadMessage.count", -1) do
      delete message_thread_message_url(@message_thread_message), as: :json
    end

    assert_response :no_content
  end
end
