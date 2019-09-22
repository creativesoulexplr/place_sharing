require 'rails_helper'

RSpec.describe "places/new", type: :view do
  before(:each) do
    assign(:place, Place.new(
      :lat => "MyString",
      :lng => "MyString",
      :user_id => 1,
      :title => "MyString",
      :details => "MyText",
      :full_address => "MyText"
    ))
  end

  it "renders new place form" do
    render

    assert_select "form[action=?][method=?]", places_path, "post" do

      assert_select "input[name=?]", "place[lat]"

      assert_select "input[name=?]", "place[lng]"

      assert_select "input[name=?]", "place[user_id]"

      assert_select "input[name=?]", "place[title]"

      assert_select "textarea[name=?]", "place[details]"

      assert_select "textarea[name=?]", "place[full_address]"
    end
  end
end
