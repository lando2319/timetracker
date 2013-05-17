require 'test_helper'

class PunchcardsControllerTest < ActionController::TestCase
  setup do
    @punchcard = punchcards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:punchcards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create punchcard" do
    assert_difference('Punchcard.count') do
      post :create, punchcard: { timein: @punchcard.timein, timeout: @punchcard.timeout }
    end

    assert_redirected_to punchcard_path(assigns(:punchcard))
  end

  test "should show punchcard" do
    get :show, id: @punchcard
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @punchcard
    assert_response :success
  end

  test "should update punchcard" do
    put :update, id: @punchcard, punchcard: { timein: @punchcard.timein, timeout: @punchcard.timeout }
    assert_redirected_to punchcard_path(assigns(:punchcard))
  end

  test "should destroy punchcard" do
    assert_difference('Punchcard.count', -1) do
      delete :destroy, id: @punchcard
    end

    assert_redirected_to punchcards_path
  end
end
