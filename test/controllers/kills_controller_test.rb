require 'test_helper'

class KillsControllerTest < ActionController::TestCase
  setup do
    @kill = kills(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kills)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kill" do
    assert_difference('Kill.count') do
      post :create, kill: { date: @kill.date, granted: @kill.granted, killer: @kill.killer, target: @kill.target }
    end

    assert_redirected_to kill_path(assigns(:kill))
  end

  test "should show kill" do
    get :show, id: @kill
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kill
    assert_response :success
  end

  test "should update kill" do
    patch :update, id: @kill, kill: { date: @kill.date, granted: @kill.granted, killer: @kill.killer, target: @kill.target }
    assert_redirected_to kill_path(assigns(:kill))
  end

  test "should destroy kill" do
    assert_difference('Kill.count', -1) do
      delete :destroy, id: @kill
    end

    assert_redirected_to kills_path
  end
end
