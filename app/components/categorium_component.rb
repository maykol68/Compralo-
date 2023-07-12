# frozen_string_literal: true

class CategoriumComponent < ViewComponent::Base
  attr_reader :categorium

  def initialize(categorium: nil)
    @categorium = categorium
  end

  def title
    categorium ? categorium.name : t('.all')
  end

  def link
    categorium ? products_path(categorium_id: categorium.id) : products_path
  end

  def active?
    return true if !categorium && !params[:categorium_id]
    categorium&.id == params[:categorium_id].to_i
  end

  def classes
    "categorium text-gray-600 px-4 py-2 rounded-2xl drop-shadow-sm hover:bg-gray-300 #{background}"
  end

  private

  def background
    active? ? "bg-gray-300" : "bg-white"
  end
end
