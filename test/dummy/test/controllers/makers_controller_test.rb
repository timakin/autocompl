require 'test_helper'

class MakersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @maker = makers(:one)
  end

  test "should get index" do
    get makers_url
    assert_response :success
  end

  test "should get new" do
    get new_maker_url
    assert_response :success
  end

  test "should create maker" do
    assert_difference('Maker.count') do
      post makers_url, params: { maker: { name_en: @maker.name_en, name_ja: @maker.name_ja } }
    end

    assert_redirected_to maker_url(Maker.last)
  end

  test "should show maker" do
    get maker_url(@maker)
    assert_response :success
  end

  test "should get edit" do
    get edit_maker_url(@maker)
    assert_response :success
  end

  test "should update maker" do
    patch maker_url(@maker), params: { maker: { name_en: @maker.name_en, name_ja: @maker.name_ja } }
    assert_redirected_to maker_url(@maker)
  end

  test "should destroy maker" do
    assert_difference('Maker.count', -1) do
      delete maker_url(@maker)
    end

    assert_redirected_to makers_url
  end
end
