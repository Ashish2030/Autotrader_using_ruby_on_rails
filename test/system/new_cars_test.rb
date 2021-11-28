require "application_system_test_case"

class NewCarsTest < ApplicationSystemTestCase
  setup do
    @new_car = new_cars(:one)
  end

  test "visiting the index" do
    visit new_cars_url
    assert_selector "h1", text: "New Cars"
  end

  test "creating a New car" do
    visit new_cars_url
    click_on "New New Car"

    fill_in "Bhp", with: @new_car.bhp
    fill_in "Carname", with: @new_car.carname
    fill_in "Company", with: @new_car.company
    fill_in "Engion", with: @new_car.engion
    fill_in "Mileage", with: @new_car.mileage
    fill_in "Price", with: @new_car.price
    fill_in "Seat", with: @new_car.seat
    fill_in "Type", with: @new_car.type
    click_on "Create New car"

    assert_text "New car was successfully created"
    click_on "Back"
  end

  test "updating a New car" do
    visit new_cars_url
    click_on "Edit", match: :first

    fill_in "Bhp", with: @new_car.bhp
    fill_in "Carname", with: @new_car.carname
    fill_in "Company", with: @new_car.company
    fill_in "Engion", with: @new_car.engion
    fill_in "Mileage", with: @new_car.mileage
    fill_in "Price", with: @new_car.price
    fill_in "Seat", with: @new_car.seat
    fill_in "Type", with: @new_car.type
    click_on "Update New car"

    assert_text "New car was successfully updated"
    click_on "Back"
  end

  test "destroying a New car" do
    visit new_cars_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "New car was successfully destroyed"
  end
end
