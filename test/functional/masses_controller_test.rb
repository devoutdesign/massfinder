require 'test_helper'

class MassesControllerTest < ActionController::TestCase
  setup do
    @mass = masses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:masses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mass" do
    assert_difference('Mass.count') do
      post :create, :mass => @mass.attributes
    end

    assert_redirected_to mass_path(assigns(:mass))
  end

  test "should show mass" do
    get :show, :id => @mass.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @mass.to_param
    assert_response :success
  end

  test "should update mass" do
    put :update, :id => @mass.to_param, :mass => @mass.attributes
    assert_redirected_to mass_path(assigns(:mass))
  end

  test "should destroy mass" do
    assert_difference('Mass.count', -1) do
      delete :destroy, :id => @mass.to_param
    end

    assert_redirected_to masses_path
  end
end
