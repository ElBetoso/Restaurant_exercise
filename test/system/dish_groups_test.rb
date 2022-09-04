require "application_system_test_case"

class DishGroupsTest < ApplicationSystemTestCase
  setup do
    @dish_group = dish_groups(:one)
  end

  test "visiting the index" do
    visit dish_groups_url
    assert_selector "h1", text: "Dish groups"
  end

  test "should create dish group" do
    visit dish_groups_url
    click_on "New dish group"

    fill_in "Name", with: @dish_group.Name
    click_on "Create Dish group"

    assert_text "Dish group was successfully created"
    click_on "Back"
  end

  test "should update Dish group" do
    visit dish_group_url(@dish_group)
    click_on "Edit this dish group", match: :first

    fill_in "Name", with: @dish_group.Name
    click_on "Update Dish group"

    assert_text "Dish group was successfully updated"
    click_on "Back"
  end

  test "should destroy Dish group" do
    visit dish_group_url(@dish_group)
    click_on "Destroy this dish group", match: :first

    assert_text "Dish group was successfully destroyed"
  end
end
