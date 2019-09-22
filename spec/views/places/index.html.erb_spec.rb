require 'rails_helper'

RSpec.describe "places/index", type: :view do
  before(:each) do
    assign(:places, [
      Place.create!(
        :lat => "Lat",
        :lng => "Lng",
        :user_id => 2,
        :title => "Title",
        :details => "MyText",
        :full_address => "MyText"
      ),
      Place.create!(
        :lat => "Lat",
        :lng => "Lng",
        :user_id => 2,
        :title => "Title",
        :details => "MyText",
        :full_address => "MyText"
      )
    ])
  end

  it "renders a list of places" do
    render
    assert_select "tr>td", :text => "Lat".to_s, :count => 2
    assert_select "tr>td", :text => "Lng".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
