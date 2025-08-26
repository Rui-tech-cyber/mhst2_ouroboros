class MonstersController < ApplicationController
  def show
    @monster = Monster.find(params[:id])
  end
end
