# frozen_string_literal: true

require "test_helper"

class CategoriumComponentTest < ViewComponent::TestCase
  test "should render an empty categorium" do
    assert_equal(
      %(<a class=\"categorium text-gray-600 px-4 py-2 rounded-2xl drop-shadow-sm hover:bg-gray-300 bg-gray-300\" href=\"/\">Cualquiera</a>),
      render_inline(CategoriumComponent.new).to_html
    )
  end

  test "should render a categorium" do
    categorium = Categorium.last
    assert_equal(
      %(<a class=\"categorium text-gray-600 px-4 py-2 rounded-2xl drop-shadow-sm hover:bg-gray-300 bg-white\" href=\"/?categorium_id=#{categorium.id}\">#{categorium.name}</a>),
      render_inline(CategoriumComponent.new(categorium: categorium)).to_html
    )
  end
end