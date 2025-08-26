class HomeController < ApplicationController
  def index
    @monsters = Monster.order(:kana)
  end
end
