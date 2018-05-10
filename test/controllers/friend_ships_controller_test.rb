require 'test_helper'

class FriendShipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @friend_ship = friend_ships(:one)
  end

  test "should get index" do
    get friend_ships_url
    assert_response :success
  end

  test "should get new" do
    get new_friend_ship_url
    assert_response :success
  end

  test "should create friend_ship" do
    assert_difference('FriendShip.count') do
      post friend_ships_url, params: { friend_ship: { friend_id: @friend_ship.friend_id, user_id: @friend_ship.user_id } }
    end

    assert_redirected_to friend_ship_url(FriendShip.last)
  end

  test "should show friend_ship" do
    get friend_ship_url(@friend_ship)
    assert_response :success
  end

  test "should get edit" do
    get edit_friend_ship_url(@friend_ship)
    assert_response :success
  end

  test "should update friend_ship" do
    patch friend_ship_url(@friend_ship), params: { friend_ship: { friend_id: @friend_ship.friend_id, user_id: @friend_ship.user_id } }
    assert_redirected_to friend_ship_url(@friend_ship)
  end

  test "should destroy friend_ship" do
    assert_difference('FriendShip.count', -1) do
      delete friend_ship_url(@friend_ship)
    end

    assert_redirected_to friend_ships_url
  end
end
